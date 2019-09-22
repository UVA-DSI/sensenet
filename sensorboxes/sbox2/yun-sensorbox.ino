/* 
 *  SDS sensorbox prototype, v.0.5
 *  
 *  DEV_NAME=yun
 *  DEV_ID=sbox2
 *  LOC=loc0
 *  
 *  Sensor list:
 *  SENSOR1 = MQ-2 smoke sensor (mq2)
 *  SENSOR2 = Shinyei PM2.5/10 sensor (pm)
 *  SENSOR3 = HCHO sensor (hcho)
 *  SENSOR4 = MQ-5 propane sensor (mq5)
 *  
 *  Code in the public domain
 *  Contact: lfr6d@virginia.edu
 *
 */

#include <math.h>
#include <Bridge.h>
#include <BridgeClient.h>
#include <MQTT.h>
#include "private_settings.h"

#define SENSOR1 A0
#define SENSOR2 A1
#define SENSOR3 A2
#define SENSOR4 A3

// calibration HCHO sensor
#define R0 34.28

float Vol = 0;
float sensorValue = 0;
unsigned long duration;
unsigned long starttime;
unsigned long sampletime_ms = 30000; // sample every 30s
unsigned long lowpulseoccupancy = 0;
float ratio = 0;
float concentration = 0;
long last_msg = 0;
char msg[20];

// define MQTT topics
#define SENSOR1_TOPIC   "/sbox2/loc0/mq2"
#define SENSOR2_TOPIC   "/sbox2/loc0/pm"
#define SENSOR3_TOPIC   "/sbox2/loc0/hcho"
#define SENSOR4_TOPIC   "/sbox2/loc0/mq5"

BridgeClient net;
MQTTClient client;

void mqtt_reconnect() {
  SERIAL_PORT_USBVIRTUAL.println("MQTT connecting...");
  //client.setCACert(root_ca);
  if (client.connect(mqtt_clientID, mqtt_user, mqtt_passwd)) {
    SERIAL_PORT_USBVIRTUAL.println("Connected to MQTT server");
    //client.subscribe(SENSOR1_TOPIC);
    //client.subscribe(SENSOR2_TOPIC);
    //client.subscribe(SENSOR3_TOPIC);
    //client.subscribe(SENSOR4_TOPIC);
  } else {
    SERIAL_PORT_USBVIRTUAL.println("Connection failed");
  }
  delay(1000);
}

//void msg_received(String &topic, String &payload) {
//  SERIAL_PORT_USBVIRTUAL.println("Message received: " \
//                                 + topic + ":" + payload);
//  SERIAL_PORT_USBVIRTUAL.println();
//}

// PPM formula by Allen Angier
float PPMformula(float V, float Vstart) {
    float ppm = 212.32619543773774 * exp(-(7.653015806367451 * (4.95 - V) \
                                   * Vstart) / (V * (4.95 - Vstart)));
    return ppm;
}

void setup() {
  Bridge.begin();
  SERIAL_PORT_USBVIRTUAL.begin(115200);
  client.begin(mqtt_server, mqtt_port, net);
  client.connect(mqtt_clientID, mqtt_user, mqtt_passwd);
  //client.onMessage(msg_received);
}

void loop() {
  if (!client.connected()) {
    mqtt_reconnect();
  }
  client.loop();
  long now = millis();
  if (now - last_msg > 60000) {
    last_msg = now;
    // MQ-2
    sensorValue = analogRead(SENSOR1);
    char tempString[8];
    dtostrf(sensorValue, 5, 2, tempString);
    client.publish(SENSOR1_TOPIC, tempString);
    SERIAL_PORT_USBVIRTUAL.println(sensorValue);
    
    // PM sensor
    duration = pulseIn(SENSOR2, LOW);
    lowpulseoccupancy = lowpulseoccupancy + duration;
    ratio = lowpulseoccupancy / (sampletime_ms * 10.0); 
    concentration = 1.1 * pow(ratio,3) - \
                    3.8 * pow(ratio,2) + \
                    520 * ratio + 0.62; // using datasheet spec curve
    SERIAL_PORT_USBVIRTUAL.println(concentration);
    lowpulseoccupancy = 0;
    dtostrf(concentration, 5, 2, tempString);
    client.publish(SENSOR2_TOPIC, tempString);
    
    // HCHO sensor, formula by Seeed Studio
    int sensorValue = analogRead(SENSOR3);
    double Rs = (1023.0 / sensorValue) - 1;
    double ppm = pow(10.0,((log10(Rs/R0) - 0.0827) / (-0.4807)));
    dtostrf(ppm, 5, 2, tempString);
    client.publish(SENSOR3_TOPIC, tempString);
    SERIAL_PORT_USBVIRTUAL.println(ppm);

    // MQ-5
    int mq5Value = analogRead(SENSOR4);
    Vol = (float)mq5Value / 1024 * 5.0;
    dtostrf(Vol, 5, 2, tempString);
    client.publish(SENSOR4_TOPIC, tempString);
    SERIAL_PORT_USBVIRTUAL.println(Vol);
  }
}
