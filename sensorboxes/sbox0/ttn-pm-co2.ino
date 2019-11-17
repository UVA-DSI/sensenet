/*
  *  SDS sensorbox prototype, v.0.1
  *
  *  DEV_NAME=mendes
  *  DEV_ID=sbox0
  *  LOC=loc0
  *
  *  Sensor list:
  *  SENSOR1 = PMS7003 (pm2.5, pm10)
  *  SENSOR2 = Sensiron SCD30 (CO2, temp, hum)
  *
  *  Depends on:
  *  Arduino-lmic, RTCZero, PMS, Sparkfun SCD30 library
  *
  *  Derives from:
  *  Copyright (c) 2015 Thomas Telkamp and Matthijs Kooijman
  *  Copyright (c) 2018 Terry Moore, MCCI
  *  Copyright (c) 2018 Brent Rubell, Adafruit Industries
  *
  */

#include <lmic.h>
#include <hal/hal.h>
#include <SPI.h>
#include <Wire.h>
#include <PMS.h>
#include <RTCZero.h>
#include <SparkFun_SCD30_Arduino_Library.h>
#include <Adafruit_SleepyDog.h>
#include <RH_RF95.h>

// init sensor objs
PMS pms(Serial1);
PMS::DATA data;
SCD30 CO2Sensor;

const uint8_t alarmInterval = 1;
const uint8_t pmsRSTPin = 12;
unsigned char pin_val;

// application EUI
static const u1_t PROGMEM APPEUI[8] = {};
void os_getArtEui(u1_t *buf) { memcpy_P(buf, APPEUI, 8); }

// dev EUI
static const u1_t PROGMEM DEVEUI[8] = {};
void os_getDevEui(u1_t *buf) { memcpy_P(buf, DEVEUI, 8); }

// app key
static const u1_t PROGMEM APPKEY[16] = {};
void os_getDevKey(u1_t *buf) { memcpy_P(buf, APPKEY, 16); }

// payload to TTN gateway
static uint8_t payload[14];
static osjob_t sendjob;

// schedule TX every this many seconds
const unsigned TX_INTERVAL = 30;

// pin mapping for Feather M0
const lmic_pinmap lmic_pins = {
    .nss = 8,
    .rxtx = LMIC_UNUSED_PIN,
    .rst = 4,
    .dio = {3, 6, LMIC_UNUSED_PIN}, // jumper pin 6 -> IO1
    .rxtx_rx_active = 0,
    .rssi_cal = 8, // LBT cal for the Feather M0, in dB
    .spi_freq = 8000000,
};

RH_RF95 rf95(8, 3);

void ledOn()
{
    digitalWrite(LED_BUILTIN, HIGH);
}

void ledOff()
{
    digitalWrite(LED_BUILTIN, LOW);
}

void pmsSleep()
{
    digitalWrite(pmsRSTPin, LOW);
}

void pmsWake()
{
    digitalWrite(pmsRSTPin, HIGH);
}

void scdSleep()
{
    CO2Sensor.sendCommand(0x0104);
}

void scdWake()
{
    CO2Sensor.begin();
}

// LoRa transmission loop
void do_send(osjob_t *j)
{
    // Check if there is not a current TX/RX job running
    if (LMIC.opmode & OP_TXRXPEND)
    {
        Serial.println(F("OP_TXRXPEND, not sending"));
    }
    else
    {
        // PMS start and wait 20s for stable readings
        delay(20000);
        // read the temperature + humidity
        if (CO2Sensor.dataAvailable())
        {
            float co2 = CO2Sensor.getCO2();
            float temp = CO2Sensor.getTemperature();
            float rel_hum = CO2Sensor.getHumidity();
            Serial.print("CO2: ");
            Serial.print(co2);
            Serial.println("ppm");
            Serial.print("Temp: ");
            Serial.print(temp);
            Serial.println(" C");
            Serial.print("Humidity: ");
            Serial.print(rel_hum);
            Serial.println(" \%");
            // convert payload for CO2, temp, humidity
            uint32_t co2_conv = (uint32_t)(co2 * 100);
            // payload byte array
            payload[0] = (co2_conv & 0xFF);
            payload[1] = (co2_conv >> 8) & 0xFF;
            payload[2] = (co2_conv >> 16) & 0xFF;
            payload[3] = (co2_conv >> 24) & 0xFF;

            uint16_t payloadTemp = (uint16_t)(temp * 100);
            payload[4] = payloadTemp >> 8;
            payload[5] = payloadTemp & 0xFF;

            uint16_t payloadHumid = (uint16_t)(rel_hum * 100);
            payload[6] = payloadHumid >> 8;
            payload[7] = payloadHumid & 0xFF;
        }

        // collect PMS values
        pms.requestRead();
        if (pms.readUntil(data, 2000))
        {
            Serial.print("PM 2.5 (ug/m3): ");
            Serial.println(data.PM_AE_UG_2_5);
            uint16_t pm2_5 = data.PM_AE_UG_2_5;
            payload[8] = pm2_5 >> 8;
            payload[9] = pm2_5 & 0xFF;

            Serial.print("PM 10.0 (ug/m3): ");
            Serial.println(data.PM_AE_UG_10_0);
            uint16_t pm10 = data.PM_AE_UG_10_0;
            payload[10] = pm10 >> 8;
            payload[11] = pm10 & 0xFF;
        }
        // params: (port_number, payload_array, payload-size, request-ack?)
        LMIC_setTxData2(1, payload, sizeof(payload) - 1, 0);
    }
}

// LoRa event handling
void onEvent(ev_t ev)
{
    Serial.print(os_getTime());
    Serial.print(": ");
    switch (ev)
    {
    case EV_SCAN_TIMEOUT:
        Serial.println(F("EV_SCAN_TIMEOUT"));
        break;
    case EV_BEACON_FOUND:
        Serial.println(F("EV_BEACON_FOUND"));
        break;
    case EV_BEACON_MISSED:
        Serial.println(F("EV_BEACON_MISSED"));
        break;
    case EV_BEACON_TRACKED:
        Serial.println(F("EV_BEACON_TRACKED"));
        break;
    case EV_JOINING:
        Serial.println(F("EV_JOINING"));
        break;
    case EV_JOINED:
        Serial.println(F("EV_JOINED"));
        {
            u4_t netid = 0;
            devaddr_t devaddr = 0;
            u1_t nwkKey[16];
            u1_t artKey[16];
            LMIC_getSessionKeys(&netid, &devaddr, nwkKey, artKey);
            Serial.print("netid: ");
            Serial.println(netid, DEC);
            Serial.print("devaddr: ");
            Serial.println(devaddr, HEX);
            Serial.print("artKey: ");
            for (size_t i = 0; i < sizeof(artKey); ++i)
            {
                if (i != 0)
                    Serial.print("-");
                Serial.print(artKey[i], HEX);
            }
            Serial.println("");
            Serial.print("nwkKey: ");
            for (size_t i = 0; i < sizeof(nwkKey); ++i)
            {
                if (i != 0)
                    Serial.print("-");
                Serial.print(nwkKey[i], HEX);
            }
            Serial.println("");
        }
        // Disable link check validation (automatically enabled
        // during join, but because slow data rates change max TX
        // size, we don't use it in this example.
        LMIC_setLinkCheckMode(0);
        break;

    case EV_JOIN_FAILED:
        Serial.println(F("EV_JOIN_FAILED"));
        break;
    case EV_REJOIN_FAILED:
        Serial.println(F("EV_REJOIN_FAILED"));
        break;
        break;
    case EV_TXCOMPLETE:
        Serial.println(F("EV_TXCOMPLETE (includes waiting for RX windows)"));
        if (LMIC.txrxFlags & TXRX_ACK)
            Serial.println(F("Received ack"));
        if (LMIC.dataLen)
        {
            Serial.println(F("Received "));
            Serial.println(LMIC.dataLen);
            Serial.println(F(" bytes of payload"));
        }
        Serial.println(" :: going to standby for 10s:: ");
        scdSleep();
        ledOff();
        pmsSleep();
        rf95.sleep();
        Watchdog.sleep(TX_INTERVAL * 1000);
        //-----------------------------------------------
        Serial.println(" :: waking up from standby :: ");
        rf95.setModeIdle();
        USBDevice.attach();
        ledOn();
        pmsWake();
        scdWake();
        CO2Sensor.setMeasurementInterval(15);
        // Schedule next transmission
        // os_setTimedCallback(&sendjob, os_getTime() + sec2osticks(TX_INTERVAL), do_send);
        do_send(&sendjob);
        break;
    case EV_LOST_TSYNC:
        Serial.println(F("EV_LOST_TSYNC"));
        break;
    case EV_RESET:
        Serial.println(F("EV_RESET"));
        break;
    case EV_RXCOMPLETE:
        // data received in ping slot
        Serial.println(F("EV_RXCOMPLETE"));
        break;
    case EV_LINK_DEAD:
        Serial.println(F("EV_LINK_DEAD"));
        break;
    case EV_LINK_ALIVE:
        Serial.println(F("EV_LINK_ALIVE"));
        break;
    case EV_TXSTART:
        Serial.println(F("EV_TXSTART"));
        break;
    default:
        Serial.print(F("Unknown event: "));
        Serial.println((unsigned)ev);
        break;
    }
}

// MCU setup
void setup()
{
    delay(3000);
    Serial.begin(9600);
    Serial.println(F("Starting sbox0 \\m/"));

    // necessary for low-energy mode on M0
    for (pin_val = 0; pin_val < 23; pin_val++)
    {
        pinMode(pin_val, INPUT_PULLUP);
    }

    for (pin_val = 32; pin_val < 42; pin_val++)
    {
        pinMode(pin_val, INPUT_PULLUP);
    }
    pinMode(12, OUTPUT);
    pmsWake();

    // Serial1 on SAMD21 for PM sensor
    Serial1.begin(9600);
    pmsSleep();
    // start CO2 + temp + humidity sensors
    Wire.begin();
    CO2Sensor.begin();
    CO2Sensor.setMeasurementInterval(20 + TX_INTERVAL - 1); // in seconds
    CO2Sensor.setAltitudeCompensation(174);                 // in meters
    CO2Sensor.setAmbientPressure(835);                      // in mBar
    scdSleep();
    // LMIC init
    os_init();
    // Reset the MAC state. Session and pending data transfers will be discarded
    LMIC_reset();
    // Disable link-check mode and ADR, because ADR tends to complicate testing
    LMIC_setLinkCheckMode(0);
    // Set the data rate to Spreading Factor 7.  This is the fastest supported rate for 125 kHz channels, and it
    // minimizes air time and battery power. Set the transmission power to 14 dBi (25 mW)
    LMIC_setDrTxpow(DR_SF7, 14);
    // in the US, with TTN, it saves join time if we start on subband 1 (channels 8-15)
    LMIC_selectSubBand(1);
    // Start job (sending automatically starts OTAA too)
    do_send(&sendjob);
}

void loop()
{
    os_runloop_once();
}
