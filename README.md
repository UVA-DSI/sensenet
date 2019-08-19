# SDS Sensenet

This is the temporary repository for the 'School of Data Science' 
Sensenet project at University of Virginia. Here you will find the 
sources for the backend, frontend, and sensor devices we use in 
our sensor network.

This project is being developed in partnership with Smart Cville
and Linklab at UVA.

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

## Contact and licensing info

Reach out to LF Murillo (@unixjazz) for more information about the 
project. Source files are released in the public domain, unless 
specified in the LICENSE file included in the directory of a
library component or build tool we use. All the documentation is
released as 'CC-BY-SA-4.0-international'.

__Happy environmental sensing and hw hacking!__

---
Sign-off: LFRM, 08-16-2019
