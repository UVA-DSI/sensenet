### PROJECT_DIR
PROJECT_DIR = $(CURDIR)

### ARDMK_DIR
ARDMK_DIR = $(CURDIR)/Arduino-Makefile

### ARDUINO_DIR
ARDUINO_DIR = /opt/arduino-1.8.9

### USER_LIB_PATH
USER_LIB_PATH := $(PROJECT_DIR)/lib

# ARDUINO LIBS
ARDUINO_LIBS = arduino-lmic Wire PMS_Library RTCZero SparkFun_SCD30_Arduino_Library 

# Board
BOARD_TAG = adafruit_feather_m0 

### MONITOR_PORT
### The port your board is connected to. Using an '*' tries all the ports and finds the right one. Choose one of the two.
MONITOR_PORT      = /dev/ttyUSB*
#MONITOR_PORT      = /dev/ttyACM*

### MONITOR_BAUDRATE
### It must be set to Serial baudrate value you are using.
MONITOR_BAUDRATE  = 9600

### AVR_TOOLS_DIR
### Path to the AVR tools directory such as avr-gcc, avr-g++, etc.
AVR_TOOLS_DIR     = $(ARDUINO_DIR)/hardware/tools/avr

### AVRDUDE
AVRDUDE           = $(ARDUINO_DIR)/hardware/tools/avr/bin/avrdude

### CFLAGS_STD
CFLAGS_STD        = -std=gnu11

### CXXFLAGS_STD
CXXFLAGS_STD      = -std=gnu++11
#CXXFLAGS_STD      = -std=gnu++17


### CPPFLAGS
CXXFLAGS         += -pedantic -Wall -Wextra
LDFLAGS          += -fdiagnostics-color

### OBJDIR
### This is were you put the binaries you just compile using 'make'
CURRENT_DIR       = $(shell basename $(CURDIR))
OBJDIR            = $(PROJECT_DIR)/build/$(CURRENT_DIR)/$(BOARD_TAG)

## M0 specifics
#ARDUINO_VAR_PATH   = $(HOME)/.arduino15/packages/adafruit/hardware/samd/1.0.13/variants
#ARDUINO_CORE_PATH  = $(HOME)/.arduino15/packages/adafruit/hardware/samd/1.0.13/cores/arduino
#BOOTLOADER_PARENT  = $(HOME)/.../.arduino15/packages/adafruit/hardware/samd/1.0.13/bootloaders

### path to Arduino.mk, inside the ARDMK_DIR
include $(ARDMK_DIR)/Sam.mk
