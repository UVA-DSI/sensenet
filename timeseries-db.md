# Timeseries db 'line protocol'

Influxdb is 'schemaless' which means it will generate a new series
when we send an insert statement with new 'tags' (such as sensor_type).
Once a field has been created with a particular type (float / int),
trying to write a different data type on it will generate an error.

Here is the suggested structure for data points on the database:

```
NETWORK_NAME,dev=DEV_ID,loc=DEV_LOC,topic=SENSOR_TYPE value=VALUE TIMESTAMP
```

Where:

* 'NETWORK_NAME': sensor network identifier (string)
* 'DEV_ID': device identifier (string)
* 'DEV_LOC': device localization (string)
* 'SENSOR_TYPE': temp, CO2, lux, pm25, CO2, humidity, etc. (string)
* 'VALUE': sensor measurement value (float)
* 'TIMESTAMP': timestamp of measurement (Unix epoch)

Here is an example:
```
sds-sensenet,dev=sbox1,loc=loc0,topic=temp value=32.02 1566183001355985604
```

Observations:

* There is no need to provide a TIMESTAMP (if running NTP);
* TIMESTAMP is always UTC (in Unix epoch format);
* Field keys (value) are required, they are always strings;
* Field values are 'floats' by default;
* Tags are indexed, fields are not: avoid having too many tags.

## Influxdb basic query language

For queries, we can use the API or the influxdb client:

```
influx -host example.org -port 8086 -ssl -username -p
```

If self-signed certificates are being used, add '-unsafeSsl'.
 
## Basic command list

To list existing databases:

```
show databases
```

To select a particular database:

```
use databasename
```

To list existing 'measurements' (e.g. sensorbox /sbox0):

```
show measurements
```

To query for all the measurements on a specific device:

```
select * from sbox1
```

## TODO

* Complete the documentation
* Complete 'ansible' playbooks
* Test alternatives to 'Influx DB' (given its proprietary HA components)

---
Sign-off: LFRM, 07-14-2019
