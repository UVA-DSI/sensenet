# Set this if the IDE is not in your $PATH or you want to use a specific version:
ARDUINO_DIR = /opt/arduino-1.8.9

# Programmer type:
ISP_PROG = usbasp

# arduino-mk vars
PROJECT_DIR = $(CURDIR)
USER_LIB_PATH := $(PROJECT_DIR)/lib
ARDUINO_LIBS = MQ2 TinyWireM LiquidCrystal_I2C

# path for arduino-mk
include $(CURDIR)/arduino-mk/Arduino.mk

BOARD_TAG = attiny85at8
ALTERNATIVE_CORE = tiny
#BOARD_TAG = attiny44-8
#BOARD_TAG = attiny84-20

# Important: You have to use 'make ispload' when using an ISP.
