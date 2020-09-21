/*
 * Ostenda proto, v.0.5
 * 
 * DEV_name = "ESP32S"
 * DEV_ID = "esp32s-aschool-a3"
 * LOC = loc0
 * TOPIC = ostenda0/tree1/avg
 *  
 * SENSOR1 = /ostenda0/tree1/avg
 *   
 * Dependencies: FastLED v3.3, PubSub v2.8
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *    
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 * 
 * See AUTHORS and LICENSE files for more details
 *
 */

#define DEV_ID "esp32s-aschool-a3"

#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include "private_settings.h"
#include <FastLED.h>

// ESP32-S blue || red LED
#define LED_BUILTIN 13

// LED strip conf
#define DATA_PIN           4          // MOSI on Huzzah32
#define LED_TYPE           WS2812B    // If you use Neopixels
#define COLOR_ORDER        GRB        //
#define NUM_LEDS           40         // number of LEDs
#define FRAMES_PER_SECOND  120        // redefine if needed
#define BRIGHTNESS         5         // set initial brightness: 2% (0 - 255)

// MQTT constants
char tempString[8];  // temp_var
long now;            // temp_var
int last_msg;        // temp_var

// stored certs
//X509List cert(ca_root);

WiFiClientSecure ESPclient;
PubSubClient client(ESPclient);

// define MQTT topics
#define SENSOR1_TOPIC   "/ostenda0/tree1/avg"

void mqtt_connect() {
  Serial.println("MQTT connecting...");
  String clientId = DEV_ID;
  if (client.connect(mqtt_clientID, mqtt_user, mqtt_passwd)) {
    Serial.println("Connected to MQTT server");
    client.subscribe(SENSOR1_TOPIC);
    client.setCallback(sub_callback);
  } else {
    Serial.print("Connection failed, status code = ");
    Serial.print(client.state());
  }
} 

// WiFi
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

// LED vars + fade function
CRGB leds[NUM_LEDS];
int fadeVal = 0;
int currentBright = BRIGHTNESS;

// func: LED_fade(R, fade value, current brightness)
void LED_fade(int led_color, int fadeVal, int currentBright) {
  if (fadeVal > currentBright) {
    // fade in
    while (currentBright < fadeVal) {
      currentBright++;
      // CHSV(hue, saturation, value)
      // CRGB(r, g, b)
      //for (int i = 0; i < NUM_LEDS; i++) {
      //  leds[i] = CHSV(0, led_color, 255);
        //leds[i] = CRGB(led_color, 255, 250);
      //}
      FastLED.setBrightness(currentBright);
      FastLED.show();
      delay(40);
    }        
  }
  else if (fadeVal < currentBright) {
    // fade out
    while (currentBright > fadeVal) {
      currentBright--;
      //for (int i = 0; i < NUM_LEDS; i++) {
      //  leds[i] = CHSV(0, led_color, 255);
      //}
      FastLED.setBrightness(currentBright);
      FastLED.show();
      delay(40);
    }
  }
}

// Callback for MQTT msgs + LED control

char message_buff[8];
void sub_callback(char* topic, byte* payload, unsigned int length) {
  Serial.print("Message received: ");
  Serial.println(topic);
  for (int i = 0; i < length; i++) {
    message_buff[i] = char(payload[i]);
  }
  int i;
  message_buff[i] = '\0';
  String s = String((char*)payload);
  float f = s.toFloat();
  Serial.print("Payload: ");
  Serial.println(f, 1);
  switch (int(f)) {
    case 35 ... 39:
      LED_fade(0, 5, currentBright);
      currentBright = 5;
      Serial.println("level: 2%");
      break;
    case 40 ... 49:
      LED_fade(16, 20, currentBright);
      currentBright = 20;
      Serial.println("level: 5%");
      break;
    case 50 ... 59:
      LED_fade(32, 40, currentBright);
      currentBright = 40;
      Serial.println("level: 15%");
      break;
    case 60 ... 69:
      LED_fade(64, 89, currentBright);
      currentBright = 89;
      Serial.println("level: 35%");
      break;
    case 70 ... 79:
      LED_fade(96, 115, currentBright);
      currentBright = 115;
      Serial.println("level: 45%");
      break;
    case 80 ... 89:
      LED_fade(128, 166, currentBright);
      currentBright = 166;
      Serial.println("level: 65%");
      break;
    case 90 ... 99:
      LED_fade(200, 217, currentBright);
      currentBright = 217;
      Serial.println("level: 85%");
      break;
    case 100 ... 135:
      LED_fade(255, 255, currentBright);
      currentBright = 255;
      Serial.println("level: max");
      break;
    default:
      Serial.println("level: out of range");
      break;
  }
}

// board setup
void setup() {
  Serial.begin(115200);
  delay(1000);
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

  // LED strip
  FastLED.addLeds<LED_TYPE,DATA_PIN,COLOR_ORDER>(leds, NUM_LEDS).setCorrection(TypicalLEDStrip);

  // set initial color + brightness
  for (int i = 0; i < NUM_LEDS; i++) { 
    leds[i] = CRGB::White;
  }
  FastLED.setBrightness(BRIGHTNESS);
  FastLED.show();
  delay(20);
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
}
