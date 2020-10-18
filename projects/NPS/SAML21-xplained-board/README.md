# SAML21 prototyping notes

In this document, we describe the steps for setting up the SAML21 xplained 
pro dev board.

## Configuration

We must use a set of tools for writing the bootloader and firmware files to the 
SAML21 for prototyping purposes. Here are the steps to get it up and running:

0. Dependencies:

- OpenOCD v.0.10.0 or superior
- [GCC-arm-none-eabi-7-2017-q4-major](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)
- [BOSSA](https://github.com/shumatech/BOSSA/releases)
- Debian 10 (or any other distro) w/ extra packages: 'libwxgtk3.0-dev' and 'libreadline-dev'
- [Mattair's fork of the Arduino core w/ SAML21 support](https://github.com/mattairtech/ArduinoCore-samd)

1. Compile BOSSA
 
Just run 'make' and 'make install' to get it all ready. The binaries will
be on the folder 'bin/' ('bossa': GUI, and 'bossac': command-line tool).

2. Run OpenOCD

Plug the USB cable on the 'debug USB' port and run OpenOCD w/ the config file 
included in this repo:

```
openocd -f openocd-SAML21.cfg
```
If everything goes as planned, you will see this output:

```
cortex_m reset_config sysresetreq
Info : CMSIS-DAP: SWD  Supported
Info : CMSIS-DAP: Interface Initialised (SWD)
Info : CMSIS-DAP: FW Version = 03.25.01B6
Info : SWCLK/TCK = 1 SWDIO/TMS = 1 TDI = 1 TDO = 1 nTRST = 0 nRESET = 1
Info : CMSIS-DAP: Interface ready
Info : clock speed 400 kHz
Info : SWD DPIDR 0x0bc11477
Info : at91saml21j18.cpu: hardware has 4 breakpoints, 2 watchpoints
``` 

2. Write bootloader

If you are dealing with a new chip, you will have to write the bootloader
and set the fuses to protect it w/ OpenOCD. First connect to the chip:

```
telnet 127.0.0.1 4444 
```
Now you can write the bootloader:

```
init
reset halt
at91samd bootloader 0
program sam_ba_Generic_x21J_SAML21J18B.bin verify reset
shutdown
```
The precompiled bootloader image for the SAML21J18B was obtained from the Mattair's 
repository. You can find more information on how to compile the bootloader image 
from the documentation of his fork.

If everything goes well, you are now ready to write your programs using the Arduino 
core framework to the target (SAML21). This is the output of a successful verification:

```
** Programming Started **
auto erase enabled
Info : SAMD MCU: SAML21J18B (256KB Flash, 32KB RAM)
wrote 16384 bytes from file /home/unixjazz/code/SAML21-xplained-board/bootloader-arduino/sam_ba_Generic_x21J_SAML21J18B.bin in 3.540651s (4.519 KiB/s)
** Programming Finished **
** Verify Started **
verified 4964 bytes in 0.181510s (26.707 KiB/s)
** Verified OK **
** Resetting Target **
``` 

3. Write your firmware

If you plug your board using the 'target USB' port, it should enumerate and 
you should have access to it. Now, you can use any tool to program your device
using the USB port. You can use any sketch that make use of USB output to test.

## Using the ATMEL ICE programmer

If you are privileged enough to have an ATMEL ICE programmer, you can use it to program
the bootloader on a brand new chip. 

Please note that you can also use any STM32F103 that you might have laying around... 
In any case, here is how to do it with the super expensive programmer!

0. Make sure you have all OpenOCD v0.10 or superior installed.  

1. Use the file we provided `openocd-ATMEL-ICE.cfg` to set-up your programmer, plug 
your programmer SAM cortex port to the `Cortex Debug port` of your board. Then, power
your board via `target USB` with a USB power cable and run:

`openocd -f openocd-ATMEL-ICE.cfg`

This is the output you will see on your console:

```
Info : Listening on port 6666 for tcl connections
Info : Listening on port 4444 for telnet connections
Info : CMSIS-DAP: SWD  Supported
Info : CMSIS-DAP: JTAG Supported
Info : CMSIS-DAP: FW Version = 01.00.0021
Info : CMSIS-DAP: Serial# = J42700024764
Info : CMSIS-DAP: Interface Initialised (SWD)
Info : SWCLK/TCK = 1 SWDIO/TMS = 1 TDI = 1 TDO = 1 nTRST = 0 nRESET = 1
Info : CMSIS-DAP: Interface ready
Info : clock speed 400 kHz
Info : SWD DPIDR 0x0bc11477
Info : at91saml21j18.cpu: hardware has 4 breakpoints, 2 watchpoints
Info : starting gdb server for at91saml21j18.cpu on 3333
Info : Listening on port 3333 for gdb connections
```

In this case, I am using the SAML21 Xplained board. Just make sure you set 
the 'target' properly to match your chip in the openocd conf file.

2. We need to build the bootloader for our board and our specific target MCU.
Change to the directory `bootloader/ArduinoCore-samd-1.6.18-beta-b1/bootloaders/zero`
and type:

```
BOARD_ID=XPLAINED_SAML21 MCU=SAML21J18B make all mostly_clean
```
After a few instants, you will have the bootloader (8K) with USB terminal support ready:
`sam_ba_XPLAINED_SAML21_SAML21J18B.bin`.

3. Now you need to burn the bootloader, so you can use Arduino compatible
sketches. We will be using a bootloader we compiled above for the SAML21 Xplained board.
Type `telnet localhost 3333` and proceed to program your bootloader:

```
reset init
at91samd bootloader 0
program /sensenet/projects/NPS/SAML21-xplained-board/sam_ba_XPLAINED_SAML21_SAML21J18B.bin verify reset
shutdown
```

If everything goes as planned, you should see this output:

```
target halted due to debug-request, current mode: Thread 
xPSR: 0x61000000 pc: 0x000004a8 msp: 0x20007ffc
** Programming Started **
SAMD MCU: SAML21J18B (256KB Flash, 32KB RAM)
** Programming Finished **
** Verify Started **
** Verified OK **
** Resetting Target **
```

You should verify if everything is fine by checking if the board is properly enumerated
by running `sudo dmesg`:

```
usb 3-1.2: New USB device found, idVendor=0000, idProduct=0000, bcdDevice= 2.00
usb 3-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
cdc_acm 3-1.2:1.0: ttyACM0: USB ACM device
```

You are now ready to upload an arduino firmware (such as `usb-term-test.bin` under `sketches`
folder) to test the USB terminal.

Please note that for actual usage, a `board definition` needs to be specified with the 
SAML21 Xplained board pinout. We currently do not have the board description ready for Big Dot. 
This is on our the TODO list.

Voilà! Toolchain and programmer are now ready for embedded fun to start.

__Happy hw hacking!__

-- Sign-off: LFRM, 10/18/2020

