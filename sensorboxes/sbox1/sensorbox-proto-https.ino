/*
 *  SDS-sensenet proto, v.0.6
 * 
 *  DEV_name = "nodemcu-1.0"
 *  DEV_ID = sbox1
 *  LOC = loc0
 * 
 *  SENSOR1 = BMP-388 (temp)
 *  SENSOR2 = BMP-388 (pressure)
 *  SENSOR3 = HTU21D-F (humidity)
 *  SENSOR4 = SGP30 (TVOC)
 *  SENSOR5 = SGP30 (eCO2)
 *  SENSOR6 = VEML7700 (lux)
 *  SENSOR7 = VEML7700 (white)
 *  SENSOR8 = VEML7700 (ALS)
 *  
 *  Code in the public domain!
 *  Contact: <lfr6d@virginia.edu>
 *  
 *  Libraries for sensors by Limor Fried & Kevin Townsend
 *  for Adafruit Industries (tm)
 */

#include <Wire.h>
#include <ESP8266WiFi.h>
#include <PubSubClient.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BMP3XX.h>
#include <Adafruit_SGP30.h>
#include <Adafruit_HTU21DF.h>
#include <Adafruit_VEML7700.h>
#include "private_settings.h"

char tempString[8];  // temp_var
float temperature;   // celsius
float humidity;      // % RH
float pressure;      // hectopascal
float white;         // white_light
float lux;           // lux
int als;             // ambient_light
int last_msg;        // temp_var
int tvoc;            // ppb
int co2;             // ppm
long now;            // temp_var

// store certs
X509List cert(ca_root);
WiFiClientSecure ESPclient;
PubSubClient client(ESPclient);

// declare sensor objects
Adafruit_BMP3XX bmp;
Adafruit_SGP30 sgp;
Adafruit_HTU21DF htu;
Adafruit_VEML7700 veml;

// define MQTT topics
#define SENSOR1_TOPIC   "/sbox1/loc0/temp"
#define SENSOR2_TOPIC   "/sbox1/loc0/pressure"
#define SENSOR3_TOPIC   "/sbox1/loc0/humidity"
#define SENSOR4_TOPIC   "/sbox1/loc0/TVOC"
#define SENSOR5_TOPIC   "/sbox1/loc0/CO2"
#define SENSOR6_TOPIC   "/sbox1/loc0/lux"
#define SENSOR7_TOPIC   "/sbox1/loc0/white"
#define SENSOR8_TOPIC   "/sbox1/loc0/ALS"

void mqtt_connect() {
  Serial.println("MQTT connecting...");
  String clientId = "ESPClient";
  if (client.connect(mqtt_clientID, mqtt_user, mqtt_passwd)) {
    Serial.println("Connected to MQTT server");
    //client.subscribe(SENSOR1_TOPIC);
  } else {
    Serial.print("Connection failed, status code = ");
    Serial.print(client.state());
  }
}

// Callback for MQTT msgs, unused for now
//void receivedCallback(char* topic, byte* payload, unsigned int length) {
//  Serial.print("Message received: ");
//  Serial.println(topic);
//  Serial.print("Payload: ");
//  for (int i = 0; i < length; i++) {
//    Serial.print((char)payload[i]);
//  }
//  Serial.println();
//}

void WiFi_connect() {
  WiFi.disconnect(true);
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  delay(10000);
  
  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("");
    Serial.println("WiFi connected");
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());
  }
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
  
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);

  //ESPclient.allowSelfSignedCerts();
  ESPclient.setTrustAnchors(&cert);
  ESPclient.setFingerprint(ca_fingerprint);

  client.setServer(mqtt_server, mqtt_port);
  client.connect(mqtt_clientID, mqtt_user, mqtt_passwd);
  //client.setCallback(receivedCallback);

  // Set up BMP388 sensor (source: Adafruit)
  if (! bmp.begin()) {
    Serial.println("Could not find BMP388 sensor");
    while (1);
  }
  Serial.println("Found BMP388 sensor");
  bmp.setTemperatureOversampling(BMP3_OVERSAMPLING_8X);
  bmp.setPressureOversampling(BMP3_OVERSAMPLING_4X);
  bmp.setIIRFilterCoeff(BMP3_IIR_FILTER_COEFF_3);
  //bmp.setOutputDataRate(BMP3_ODR_50_HZ);

  // Set up SGP30 sensor (source: Adafruit)
  if (! sgp.begin()) {
    Serial.println("Could not find SGP30 sensor");
    while (1);
  }
  Serial.print("Found SGP30 serial #");
  Serial.print(sgp.serialnumber[0], HEX);
  Serial.print(sgp.serialnumber[1], HEX);
  Serial.println(sgp.serialnumber[2], HEX);
  /// Set up baseline for calibration
  sgp.setIAQBaseline(0xFFF9, 0xFFFF);

  // Set up VEML7700 sensor (source: Adafruit)
  if (! veml.begin()) {
    Serial.println("Could not find VEML7700 sensor");
    while (1);
  }
  Serial.println("Found VEML7700 sensor");
  veml.setGain(VEML7700_GAIN_1);
  veml.setIntegrationTime(VEML7700_IT_800MS);
  veml.setLowThreshold(10000);
  veml.setHighThreshold(20000);
  veml.interruptEnable(false);
  //veml.powerSaveEnable(true);
  //veml.setPowerSaveMode(VEML7700_POWERSAVE_MODE4);
}

void loop() {
  if (WiFi.status() != WL_CONNECTED) {
    WiFi_connect();
  }
  if (!client.connected()) {
    mqtt_connect();
  }
  client.loop();
  now = millis();
  // polling every 60s
  if (now - last_msg > 60000) {
    last_msg = now;
    // SENSOR1
    bmp.performReading();
    temperature = bmp.temperature;
    Serial.print("Temperature: ");
    Serial.println(temperature);
    dtostrf(temperature, 5, 2, tempString);
    client.publish(SENSOR1_TOPIC, tempString); 
    // SENSOR2
    pressure = bmp.pressure / 100.0;
    Serial.print("Pressure: ");
    Serial.println(pressure);
    dtostrf(pressure, 5, 2, tempString);
    client.publish(SENSOR2_TOPIC, tempString);
    // SENSOR3
    humidity = htu.readHumidity();
    Serial.print("Humidity: ");
    Serial.println(humidity);
    dtostrf(humidity, 5, 2, tempString);
    client.publish(SENSOR3_TOPIC, tempString);
    // SENSOR4
    sgp.IAQmeasure();
    //sgp.setHumidity(getAbsoluteHumidity(temperature, humidity));
    tvoc = sgp.TVOC;
    Serial.print("TVOC: "); 
    Serial.print(tvoc); 
    Serial.println(" ppb");
    dtostrf(tvoc, 5, 2, tempString);
    client.publish(SENSOR4_TOPIC, tempString);
    // SENSOR5
    co2 = sgp.eCO2;
    Serial.print("eCO2: "); 
    Serial.print(co2);
    Serial.println(" ppm");
    dtostrf(co2, 5, 2, tempString);
    client.publish(SENSOR5_TOPIC, tempString);
    // SENSOR6
    lux = veml.readLux();
    Serial.print("Lux: ");
    Serial.println(lux);
    dtostrf(lux, 5, 2, tempString);
    client.publish(SENSOR6_TOPIC, tempString);
    // SENSOR7
    white = veml.readWhite();
    Serial.print("White: ");
    Serial.println(white);
    dtostrf(white, 5, 2, tempString);
    client.publish(SENSOR7_TOPIC, tempString);
    // SENSOR8
    als = veml.readALS();
    Serial.print("Ambient light: ");
    Serial.println(als);
    dtostrf(als, 5, 0, tempString);
    client.publish(SENSOR8_TOPIC, tempString);
    Serial.println();
  }
}
