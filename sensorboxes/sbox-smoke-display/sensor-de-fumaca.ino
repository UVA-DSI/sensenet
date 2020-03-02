/* Detector: Mendes v0.1 */

#include <MQ2.h>
#include <TinyWireM.h>        
#include <LiquidCrystal_I2C.h>

// Conexao ATTINY85  <--> LCD
// VCC (pino 8)      <--> VCC
// GND (pino 4)      <--> GND
// SCL (pino 7, PB2) <--> SCL
// SDA (pino 5, PB0) <--> SDA

LiquidCrystal_I2C lcd(0x20,16,2);

// pino do sensor MQ-2
int sensor_pin = A0;
MQ2 mq2(sensor_pin);

void setup() {
  mq2.begin();
  TinyWireM.begin();
  lcd.init();
  lcd.backlight();
  lcd.clear();
}

void loop() {
  // leitura do sensor
  float f = mq2.readSmoke();
  // escrita no LCD
  lcd.setCursor(0,0);
  lcd.print("Concentracao: ");
  lcd.print(f, 3);
  lcd.print(" PPM");
  // 1s de pausa entre cada leitura
  delay(1000);
}
