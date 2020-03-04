/*
 *  SDS-sensenet proto, v.0.7
 * 
 *  DEV_name = "bilbo"
 *  DEV_ID = sbox-co2-tester
 *  LOC = loc0
 * 
 *  SENSOR1 = SCD30 (CO2)
 *  SENSOR2 = SGP30 (eCO2)
 *  SENSOR3 = BME680 (eCO2)
 *  
 *  Code in the public domain!
 *  Contact: <lfr6d@virginia.edu>
 *  
 *  Libraries for sensors by Limor Fried & Kevin Townsend
 *  for Adafruit Industries (tm)
 */
 
// Devices under test
#include <Adafruit_Sensor.h>
#include <Adafruit_SGP30.h>
#include <SparkFun_SCD30_Arduino_Library.h>
#include "Adafruit_BME680.h"

// WiFi-related stuff
#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include "private_settings.h"

// General hardware-related abstraction stuff
#include <Wire.h>

// store certs
X509List cert(ca_root);
WiFiClientSecure ESPclient;
PubSubClient client(ESPclient);

// declare sensor objects
SCD30 scd30;
Adafruit_SGP30 sgp30;
Adafruit_BME680 bme680;

// define MQTT topics
#define SENSOR1_TOPIC   "/sensornet/loc0/co2-a"
#define SENSOR2_TOPIC   "/sensornet/loc0/co2-b"
#define SENSOR3_TOPIC   "/sensornet/loc0/co2-c"

void mqtt_connect() {
  Serial.println("MQTT connecting...");
  String clientId = "ESPClient";
  if (client.connect(mqtt_clientID, mqtt_user, mqtt_passwd)) {
    Serial.println("Connected to MQTT server");
  } else {
    Serial.print("Connection failed, status code = ");
    Serial.print(client.state());
  }
} 

void WiFi_connect() {
  WiFi.disconnect(true);
  WiFi.begin(ssid, password);
  delay(5000);
  
  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("");
    Serial.println("WiFi connected");
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());
    digitalWrite(LED_BUILTIN, LOW);
  }
}

/**
 * Sensor 1
 */

void scd30_init() { 
  // start CO2 + temp + humidity sensor
  if (!scd30.begin()) {
    Serial.println("Could not find SCD30 sensor");
    while (1);
  }
  scd30.setAutoSelfCalibration(1);    // turn on self-calibration
  scd30.setMeasurementInterval(2);    // in seconds
  scd30.setAltitudeCompensation(174); // in meters
  scd30.setAmbientPressure(835);      // in mBar
  scd30.readMeasurement();
  Serial.println("Detected and configured SCD30 sensor");
}

/**
 * Sensor 2
 */
   
void sgp30_init() {
  // Set up SGP30 sensor (source: Adafruit)
  if (! sgp30.begin()) {
    Serial.println("Could not find SGP30 sensor");
    while (1);
  }

  // Log the boot identifiers of the device
  Serial.print("Found SGP30 serial #");
  Serial.print(sgp30.serialnumber[0], HEX);
  Serial.print(sgp30.serialnumber[1], HEX);
  Serial.println(sgp30.serialnumber[2], HEX);

  // Start up air quality algorithm
  sgp30.IAQinit();
  Serial.println("Detected and configured SGP30 sensor");
}

/**
 * Sensor 3
 */

void bme680_init() {
   if (!bme680.begin()) {
    Serial.println("Could not find BME680 sensor");
    while (1);
   }
  
  bme680.setTemperatureOversampling(BME680_OS_8X);
  bme680.setHumidityOversampling(BME680_OS_2X);
  bme680.setPressureOversampling(BME680_OS_4X);
  bme680.setIIRFilterSize(BME680_FILTER_SIZE_3);
  bme680.setGasHeater(320, 150); // 320*C for 150 ms 
}

/*  
 *  Return absolute humidity [mg/m^3] with approximation formula
 *  @param temperature [°C]
 *  @param humidity [%RH]
 *  Source: Adafruit(tm)
 *  
 */
 
uint32_t getAbsoluteHumidity(float temperature, float humidity) {
    // approximation formula from 
    // Sensirion SGP30 Driver Integration chapter 3.15
    const float absoluteHumidity = 216.7f * ((humidity / 100.0f) 
                                          * 6.112f 
                                          * exp((17.62f * temperature) 
                                          / (243.12f + temperature)) 
                                          / (273.15f + temperature));
    const uint32_t absoluteHumidityScaled = 
                   static_cast<uint32_t>(1000.0f * absoluteHumidity);
    
    return absoluteHumidityScaled;
}

void setup() {
  Serial.begin(115200);
  Serial.print("Connecting to ");
  Serial.println(ssid);
  
  pinMode(LED_BUILTIN, OUTPUT); 

  ESPclient.setTrustAnchors(&cert);
  ESPclient.setInsecure();
  
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);

  client.setServer(mqtt_server, mqtt_port);
  client.connect(mqtt_clientID, mqtt_user, mqtt_passwd);

  // Initialize hardware comms interface for the sensors - specifically I2C with SCL = D1 and SDA = D2 by default.
  Wire.begin();

  // Set up the sensors
  scd30_init();
  sgp30_init();
  bme680_init();
  
}

char tempString[8];  // temp_var
long last_msg;
long now;
void loop() {
  if (WiFi.status() != WL_CONNECTED) {
    digitalWrite(LED_BUILTIN, HIGH);
    WiFi_connect();
  }
  
  if (!client.connected()) {
    mqtt_connect();
  }
  
  client.loop();
  now = millis();
 
  // polling every 5s
  if (now - last_msg > 5000) {
    last_msg = now;
    
    // SENSOR1
    scd30.readMeasurement();
    uint16_t scd30_co2 = scd30.getCO2();  // in ppm
    float temp = scd30.getTemperature();
    float rel_hum = scd30.getHumidity();
    Serial.println("SCD30 CO2: ");
    Serial.print(scd30_co2);
    Serial.println(" ppm");
    sprintf(tempString, "%d", scd30_co2);
    client.publish(SENSOR1_TOPIC, tempString);
    
    // SENSOR2
    sgp30.IAQmeasure();
    sgp30.setHumidity(getAbsoluteHumidity(temp, rel_hum));  // compute the absolute humidity and correct baseline to compensate for change
    
    uint16_t sgp30_eco2 = sgp30.eCO2; // in ppm
    Serial.print("SGP30 eCO2: "); 
    Serial.print(sgp30_eco2);
    Serial.println(" ppm");
    sprintf(tempString, "%d", sgp30_eco2);
    client.publish(SENSOR2_TOPIC, tempString);
    
    // SENSOR3
    bme680.performReading();
    double bme680_voc = bme680.gas_resistance / 1000.0;
    Serial.print("BME680 VOCs: ");
    Serial.print(bme680_voc);
    Serial.println(" KOhms");
    dtostrf(bme680_voc, 5, 2, tempString);
    client.publish(SENSOR3_TOPIC, tempString);
    
    Serial.println();
  }
}
