/*
 *  Ostenda proto, v.0.1
 * 
 *  DEV_name = "ESP32S"
 *  DEV_ID = "esp32s-aschool0"
 *  LOC = loc0
 *  TOPIC = ostenda0/tree0
 * 
 *  SENSOR1 = hall (internal 'hall sensor') 
 *   
 *  See AUTHORS and LICENSE files for more details
 *
 */
 
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include "private_settings.h"

#define LED_BUILTIN 2

char tempString[8];  // temp_var
long now;            // temp_var
int last_msg;        // temp_var
int hall = 0;	       // hall sensor

// store certs
//X509List cert(ca_root);

WiFiClientSecure ESPclient;
PubSubClient client(ESPclient);

// declare sensor objects here:

// define MQTT topics
#define SENSOR1_TOPIC   "/ostenda0/tree0/hall"

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
  WiFi.begin(ssid, passwd);
  delay(5000);
  
  if (WiFi.status() == WL_CONNECTED) {
    Serial.println("");
    Serial.println("WiFi connected");
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());
    digitalWrite(LED_BUILTIN, LOW);
  }
}

void setup() {
  Serial.begin(115200);
  Serial.print("Connecting to ");
  Serial.println(ssid);
  
  pinMode(LED_BUILTIN, OUTPUT); 


  //ESPclient.allowSelfSignedCerts();
  //ESPclient.setTrustAnchors(&cert);
  //ESPclient.setInsecure();
  //ESPclient.setCACert(ca_root);
  //ESPclient.setFingerprint(ca_fingerprint);
  
  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, passwd);

  client.setServer(mqtt_server, mqtt_port);
  client.connect(mqtt_clientID, mqtt_user, mqtt_passwd);
  //client.setCallback(receivedCallback);
  
}

void loop() {
  if (WiFi.status() != WL_CONNECTED) {
    digitalWrite(LED_BUILTIN, HIGH);
    WiFi_connect();
    delay(2000);
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
    hall = hallRead();
    Serial.print("Hall sensor: ");
    Serial.println(hall);
    dtostrf(hall, 5, 2, tempString);
    client.publish(SENSOR1_TOPIC, tempString);
    Serial.println();
  }
}
