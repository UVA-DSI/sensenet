/*
 * Ostenda proto, v.0.5
 * 
 * DEV_name = "ESP32S"
 * DEV_ID = "esp32s-a1"
 * LOC = loc0
 * TOPIC = ostenda0/tree1/dbA
 *  
 * SENSOR1 = ICS43434
 *   
 * Dependencies: FastLED v3.3, PubSub v2.8
 * 
 * Contains ESP32 + I2S microphone capture code from:
 * "Display A-weighted sound level measured by I2S Microphone"
 * (c)2019 Ivan Kostoski
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
 
#include <WiFiClientSecure.h>
#include <PubSubClient.h>
#include "private_settings.h"
#include <FastLED.h>
#include <driver/i2s.h>
#include "sos-iir-filter.h"

// ESP32-S blue || red LED
#define LED_BUILTIN 13

// LED strip conf
#define DATA_PIN           4          // MOSI on Huzzah32
#define LED_TYPE           WS2812B    // If you use Neopixels
#define COLOR_ORDER        GRB        //
#define NUM_LEDS           40         // number of LEDs
#define FRAMES_PER_SECOND  120        // redefine if needed
#define BRIGHTNESS         5         // set initial brightness: 2% (0 - 255)

// Mic conf
#define LEQ_PERIOD        1           // second(s)
#define WEIGHTING         C_weighting // Options: 'C_weighting' or 'None' (Z_weighting)
#define LEQ_UNITS         "LAeq"      // customize based on above weighting used
#define DB_UNITS          "dBA"       // customize based on above weighting used

// NOTE: Some microphones require at least DC-Blocker filter
#define MIC_EQUALIZER     ICS43434    // See below for defined IIR filters or set to 'None' to disable
#define MIC_OFFSET_DB     3.0103      // Default offset (sine-wave RMS vs. dBFS). Modify this value for linear calibration

// Customize these values from microphone datasheet
#define MIC_SENSITIVITY   -26         // dBFS value expected at MIC_REF_DB (Sensitivity value from datasheet)
#define MIC_REF_DB        94.0        // Value at which point sensitivity is specified in datasheet (dB)
#define MIC_OVERLOAD_DB   116.0       // dB - Acoustic overload point
#define MIC_NOISE_DB      29          // dB - Noise floor
#define MIC_BITS          24          // valid number of bits in I2S data
#define MIC_CONVERT(s)    (s >> (SAMPLE_BITS - MIC_BITS))
#define MIC_TIMING_SHIFT  0           // Set to one to fix MSB timing for some microphones, i.e. SPH0645LM4H-x

// Calculate reference amplitude value at compile time
constexpr double MIC_REF_AMPL = pow(10, double(MIC_SENSITIVITY)/20) * ((1<<(MIC_BITS-1))-1);

// I2S pins - Can be routed to almost any (unused) ESP32 pin.
//            SD can be any pin, including input only pins (36-39).
//            SCK (i.e. BCLK) and WS (i.e. L/R CLK) must be output capable pins
#define I2S_WS            27 
#define I2S_SCK           14
#define I2S_SD            21

// I2S peripheral to use (0 or 1)
#define I2S_PORT          I2S_NUM_0

// IIR Filters
// DC-Blocker filter - removes DC component from I2S data
// See: https://www.dsprelated.com/freebooks/filters/DC_Blocker.html
// a1 = -0.9992 should heavily attenuate frequencies below 10Hz
SOS_IIR_Filter DC_BLOCKER = { 
  gain: 1.0,
  sos: {{-1.0, 0.0, +0.9992, 0}}
};

// Equalizer IIR filters to flatten microphone frequency response
// TDK/InvenSense ICS-43434
// Datasheet: https://www.invensense.com/wp-content/uploads/2016/02/DS-000069-ICS-43434-v1.1.pdf
// B = [0.477326418836803, -0.486486982406126, -0.336455844522277, 0.234624646917202, 0.111023257388606];
// A = [1.0, -1.93073383849136326, 0.86519456089576796, 0.06442838283825100, 0.00111249298800616];
SOS_IIR_Filter ICS43434 = { 
  gain: 0.477326418836803,
  sos: { // Second-Order Sections {b1, b2, -a1, -a2}
   {+0.96986791463971267, 0.23515976355743193, -0.06681948004769928, -0.00111521990688128},
   {-1.98905931743624453, 0.98908924206960169, +1.99755331853906037, -0.99755481510122113}
  }
};

// Knowles SPH0645LM4H-B, rev. B
// https://cdn-shop.adafruit.com/product-files/3421/i2S+Datasheet.PDF
// B ~= [1.001234, -1.991352, 0.990149]
// A ~= [1.0, -1.993853, 0.993863]
// With additional DC blocking component
SOS_IIR_Filter SPH0645LM4H_B_RB = {
  gain: 1.00123377961525, 
  sos: { // Second-Order Sections {b1, b2, -a1, -a2}
    {-1.0, 0.0, +0.9992, 0}, // DC blocker, a1 = -0.9992
    {-1.988897663539382, +0.988928479008099, +1.993853376183491, -0.993862821429572}
  }
};

// Weighting filters
// A-weighting IIR Filter, Fs = 48KHz 
// (By Dr. Matt L., Source: https://dsp.stackexchange.com/a/36122)
// B = [0.169994948147430, 0.280415310498794, -1.120574766348363, 0.131562559965936, 0.974153561246036, -0.282740857326553, -0.152810756202003]
// A = [1.0, -2.12979364760736134, 0.42996125885751674, 1.62132698199721426, -0.96669962900852902, 0.00121015844426781, 0.04400300696788968]
SOS_IIR_Filter A_weighting = {
  gain: 0.169994948147430, 
  sos: { // Second-Order Sections {b1, b2, -a1, -a2}
    {-2.00026996133106, +1.00027056142719, -1.060868438509278, -0.163987445885926},
    {+4.35912384203144, +3.09120265783884, +1.208419926363593, -0.273166998428332},
    {-0.70930303489759, -0.29071868393580, +1.982242159753048, -0.982298594928989}
  }
};

// C-weighting IIR Filter, Fs = 48KHz 
// Designed by invfreqz curve-fitting, see respective .m file
// B = [-0.49164716933714026, 0.14844753846498662, 0.74117815661529129, -0.03281878334039314, -0.29709276192593875, -0.06442545322197900, -0.00364152725482682]
// A = [1.0, -1.0325358998928318, -0.9524000181023488, 0.8936404694728326   0.2256286147169398  -0.1499917107550188, 0.0156718181681081]
SOS_IIR_Filter C_weighting = {
  gain: -0.491647169337140,
  sos: { 
    {+1.4604385758204708, +0.5275070373815286, +1.9946144559930252, -0.9946217070140883},
    {+0.2376222404939509, +0.0140411206016894, -1.3396585608422749, -0.4421457807694559},
    {-2.0000000000000000, +1.0000000000000000, +0.3775800047420818, -0.0356365756680430}
  }
};

// Sampling
#define SAMPLE_RATE       48000 // Hz, fixed to design of IIR filters
#define SAMPLE_BITS       32    // bits
#define SAMPLE_T          int32_t 
#define SAMPLES_SHORT     (SAMPLE_RATE / 8) // ~125ms
#define SAMPLES_LEQ       (SAMPLE_RATE * LEQ_PERIOD)
#define DMA_BANK_SIZE     (SAMPLES_SHORT / 16)
#define DMA_BANKS         32

// Data we push to 'samples_queue'
struct sum_queue_t {
  // Sum of squares of mic samples, after Equalizer filter
  float sum_sqr_SPL;
  // Sum of squares of weighted mic samples
  float sum_sqr_weighted;
  // Debug only, FreeRTOS ticks we spent processing the I2S data
  uint32_t proc_ticks;
};
QueueHandle_t samples_queue;

// Static buffer for block of samples
float samples[SAMPLES_SHORT] __attribute__((aligned(4)));

// I2S Microphone sampling setup 
void mic_i2s_init() {
  const i2s_config_t i2s_config = {
    mode: i2s_mode_t(I2S_MODE_MASTER | I2S_MODE_RX),
    sample_rate: SAMPLE_RATE,
    bits_per_sample: i2s_bits_per_sample_t(SAMPLE_BITS),
    channel_format: I2S_CHANNEL_FMT_ONLY_LEFT,
    communication_format: i2s_comm_format_t(I2S_COMM_FORMAT_I2S | I2S_COMM_FORMAT_I2S_MSB),
    intr_alloc_flags: ESP_INTR_FLAG_LEVEL1,
    dma_buf_count: DMA_BANKS,
    dma_buf_len: DMA_BANK_SIZE,
    use_apll: true,
    tx_desc_auto_clear: false,
    fixed_mclk: 0
  };
  // I2S pin mapping
  const i2s_pin_config_t pin_config = {
    bck_io_num:   I2S_SCK,  
    ws_io_num:    I2S_WS,    
    data_out_num: -1, // not used
    data_in_num:  I2S_SD   
  };

  i2s_driver_install(I2S_PORT, &i2s_config, 0, NULL);

  #if (MIC_TIMING_SHIFT > 0) 
    // Undocumented (?!) manipulation of I2S peripheral registers
    // to fix MSB timing issues with some I2S microphones
    REG_SET_BIT(I2S_TIMING_REG(I2S_PORT), BIT(9));   
    REG_SET_BIT(I2S_CONF_REG(I2S_PORT), I2S_RX_MSB_SHIFT);  
  #endif
  
  i2s_set_pin(I2S_PORT, &pin_config);
}

// I2S Reader Task
// FreeRTOS priority and stack size (in 32-bit words) 
#define I2S_TASK_PRI   4
#define I2S_TASK_STACK 2048

void mic_i2s_reader_task(void* parameter) {
  mic_i2s_init();

  // Discard first block, microphone may have startup time (i.e. INMP441 up to 83ms)
  size_t bytes_read = 0;
  i2s_read(I2S_PORT, &samples, SAMPLES_SHORT * sizeof(int32_t), &bytes_read, portMAX_DELAY);

  while (true) {
    // Block and wait for microphone values from I2S
    i2s_read(I2S_PORT, &samples, SAMPLES_SHORT * sizeof(SAMPLE_T), &bytes_read, portMAX_DELAY);

    TickType_t start_tick = xTaskGetTickCount();
    
    // Convert (including shifting) integer microphone values to floats, 
    // using the same buffer (assumed sample size is same as size of float), 
    // to save a bit of memory
    SAMPLE_T* int_samples = (SAMPLE_T*)&samples;
    for(int i=0; i<SAMPLES_SHORT; i++) samples[i] = MIC_CONVERT(int_samples[i]);

    sum_queue_t q;

    // Apply equalization and calculate Z-weighted sum of squares, 
    // writes filtered samples back to the same buffer.
    q.sum_sqr_SPL = MIC_EQUALIZER.filter(samples, samples, SAMPLES_SHORT);

    // Apply weighting and calucate weigthed sum of squares
    q.sum_sqr_weighted = WEIGHTING.filter(samples, samples, SAMPLES_SHORT);

    // Debug only. Ticks we spent filtering and summing block of I2S data
    //q.proc_ticks = xTaskGetTickCount() - start_tick;

    // Send the sums to FreeRTOS queue where main task will pick them up
    // and further calcualte decibel values (division, logarithms, etc...)
    xQueueSend(samples_queue, &q, portMAX_DELAY);
  }
}

// MQTT constants
char tempString[8];  // temp_var
long now;            // temp_var
int last_msg;        // temp_var

// stored certs
//X509List cert(ca_root);

WiFiClientSecure ESPclient;
PubSubClient client(ESPclient);

// define MQTT topics
#define SENSOR1_TOPIC   "/ostenda0/tree1/dBA"

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

  // Mic setup
  // Create FreeRTOS queue
  samples_queue = xQueueCreate(8, sizeof(sum_queue_t));
  
  // Create the I2S reader FreeRTOS task
  xTaskCreate(mic_i2s_reader_task, "Mic I2S Reader", I2S_TASK_STACK, NULL, I2S_TASK_PRI, NULL);

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
  // 
  // mic capture
  //
  sum_queue_t q;
  uint32_t Leq_samples = 0;
  double Leq_sum_sqr = 0;
  double Leq_dB = 0;
  
  // Read sum of samples, calculated by 'i2s_reader_task'
  while (xQueueReceive(samples_queue, &q, portMAX_DELAY)) {
    double short_RMS = sqrt(double(q.sum_sqr_SPL) / SAMPLES_SHORT);
    double short_SPL_dB = MIC_OFFSET_DB + MIC_REF_DB + 20 * log10(short_RMS / MIC_REF_AMPL);
    
    // In case of acoustic overload or below noise floor measurement, report infinty Leq value
    if (short_SPL_dB > MIC_OVERLOAD_DB) {
      Leq_sum_sqr = INFINITY;
    } else if (isnan(short_SPL_dB) || (short_SPL_dB < MIC_NOISE_DB)) {
      Leq_sum_sqr = -INFINITY;
    }

    // Accumulate Leq sum
    Leq_sum_sqr += q.sum_sqr_weighted;
    Leq_samples += SAMPLES_SHORT;

    // When we gather enough samples, calculate new Leq value
    if (Leq_samples >= SAMPLE_RATE * LEQ_PERIOD) {
      double Leq_RMS = sqrt(Leq_sum_sqr / Leq_samples);
      Leq_dB = MIC_OFFSET_DB + MIC_REF_DB + 20 * log10(Leq_RMS / MIC_REF_AMPL);
      Leq_sum_sqr = 0;
      Leq_samples = 0;
      
      // dB(A) output
      Serial.printf("%.1f\n", Leq_dB);
      break;
    }
  }
  //
  // LED brightness:
  // 1%: 35-39 dB(A)
  // ...
  // 100%: 100 - 135 dB(A)
  //
  // TODO: confirm scale
  //
  switch (int(Leq_dB)) {
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
  // polling every 60s
  now = millis();
  if (now - last_msg > 60000) {
    last_msg = now;
    // SENSOR1
    dtostrf(Leq_dB, 5, 1, tempString);
    client.publish(SENSOR1_TOPIC, tempString);
    Serial.println("Sensor topic: ");
    Serial.println(tempString);
  }
}
