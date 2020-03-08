# SAML21 prototyping notes

In this document, we describe the steps for setting up the SAML21 xplained 
pro dev board.

## Configuration

We must use a set of tools for writing the bootloader and firmware files to the 
SAML21 for prototyping purposes. Here are the steps to get it up and running:

0. Dependencies:

- OpenOCD v.0.10.0 or superior
- [GNU Embedded Toolchain for ARM](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)
- [BOSSA ](https://github.com/shumatech/BOSSA/releases)
- Debian 10 w/ extra packages: 'libwxgtk3.0-dev' and 'libreadline-dev'
- [Mattair's fork of the Arduino core w/ SAML21 support](https://github.com/mattairtech/ArduinoCore-samd)

Another example for 'board definitions' and support for the Arduino 
core framework was prepared by ATMEL:

```
https://github.com/AtmelUniversityFrance/atmel-samd21-xpro-boardmanagermodule/releases/download/v0.3.0/package_atmel-samd21-xpro-boardmanagermodule_0.3.0_index.json
```

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
reset halt
at91samd bootloader 8192
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
wrote 16384 bytes from file /home/fido/code/SAML21-xplained-board/bootloader-arduino/sam_ba_Generic_x21J_SAML21J18B.bin in 3.540651s (4.519 KiB/s)
** Programming Finished **
** Verify Started **
verified 4964 bytes in 0.181510s (26.707 KiB/s)
** Verified OK **
** Resetting Target **
``` 

3. Write your firmware

If you plug your board using the 'target USB' port, it should enumerate and 
you should have access to it. Now, you can use any tool to program your device
using the USB port:

```
bossac -p /dev/ttyACM0 -e -w -v --offset=0x2000 ../../sketches/blink.bin
```
__Happy hw hacking!__

-- Sign-off: LFRM, 03/06/20

