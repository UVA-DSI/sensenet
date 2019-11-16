# Sensenet: networked environmental sensing for all

This repository contains the documentation for the 'Sensenet'
project. Here you will find the software and hardware sources 
for the backend, frontend, and sensor devices we use.

This project is being primarily developed at the School of Data 
Science in partnership with Smart Cville and Linklab at University 
of Virginia. It is, however, open to public participation: feel
free to use, study, modify, and contribute back changes to the
work that you will find here. We are looking for contributors!

## What is included in this repository

We included 'playbooks' for the backend configuration under the
directory 'ansible' and 'conf'. They are meant to provision the 
complete backend which includes: [MQTT broker (mosquitto)](mqtt.md), 
timeseries database (influx-db), and a visualization tool (Grafana). 
For more info about the line protocol used for the timeseries db, 
[check our documentation](timeseries-db.md).

We also included source code for the 'sensorboxes' we are testing for
environmental sensing. Each directory contain information about the
sensors we equipped each box. For more details about the sensors,
[check out the 'sensor-specification'](sensor-spec.md) document and 
the 'datasheets' directory.

## Demo

[Here is one of our sensor boxes](https://sensors.unixjazz.org/d/9l9_irIWk/sbox1?orgId=1&refresh=1m&from=now-12h&to=now) 
collecting simple, real-time metrics for visualization.

## Contact and licensing info

Check the AUTHORS file for the list of contributors. For more 
information about the project, contact the project contributors.

All software is licensed as GPLv3; all hardware is licensed as
CERN-OHL-S-v2, and all documentation is released as 'CC-BY-SA-4.0
International', unless specified in the LICENSE file included in
the directory of a library component or build tool we use.

__Happy environmental sensing and hw hacking!__

