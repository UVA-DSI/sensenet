# Sensenet: networked environmental sensing for all

This repository contains the documentation for the 'Sensenet'
project. Here you will find the software and hardware sources 
for the backend, frontend, and sensor devices we use.

## What is included in this repository

We organized projects in folders with their resources (hardware, 
firmware, software, datasheets, and relevant documentation).

We also included 'playbooks' for the backend configuration under the
directory 'ansible' and 'conf'. They are meant to provision the 
complete backend which includes: [MQTT broker (mosquitto)](mqtt.md), 
timeseries database (influx-db), and a visualization tool (Grafana). 
For more info about the line protocol used for the timeseries db, 
[check our documentation](timeseries-db.md).

Each directory contains information about the sensors we are testing.
For more details, [check out the 'sensor-specification'](sensor-spec.md) 
document and the 'datasheets' directory.

## Implementations

We use different sensors, microcontrollers, and tools for different
implementations. You can get more information about each set-up following
the links below:

* Sensenet
* [Smartcville + School of Data Science](projects/CCI-SDS/README.md)
* Community Sense

## Contact and licensing info

Check the AUTHORS file for the list of contributors. For more 
information about each project, check the file CONTRIBUTORS.

All software is licensed as GPLv3; all hardware is licensed as
CERN-OHL-S-v2, and all documentation is released as 'CC-BY-SA-4.0
International', unless specified in the LICENSE file included in
the directory or in the header of source files.

__Happy environmental sensing and hw hacking!__

