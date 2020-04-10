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
influx -host example.org -port 8086 -ssl -username $USER -p YOURPASSWD
```

If self-signed certificates are being used, add '-unsafeSsl'.
You can also display timestamps in RFC-3339 format by adding '-precision rfc3339'. 
The date-time will be conveniently displayed in [Gregorian format / UTC](https://www.ietf.org/rfc/rfc3339.txt). 



## Basic command list

To list existing databases:

```
show databases
```

To select a particular database:

```
use $DATABASENAME 
```

To list existing 'measurements' (e.g. particular type of sensor):

```
show measurements
```

To query for the whole time series of a measurement:

```
select * from temp_sensor 
```

To insert a data point:

```
insert $MEASUREMENT metric_a=0.1, metric_b=1.90 
```

Field data types cannot be changed after they are entered for the
first time. To update any db entry, use the same timestamp with 
the 'insert' statement:

```
insert $MEASUREMENT metric_a=0.1, metric_b=1i ('i' stands for int) $ORIGINAL_TIMESTAMP
```

To delete data points from a particular period of time, use:

```
delete from $MEASUREMENT where time < or > or = ($TIME_IN_UNIX_EPOCH or "2020-02-01")
```

To move all the data from a 'measurement' (tables) to another DB, use:

```
select * into DB..$MEASUREMENT from DB2..$MEASUREMENT_TO_COPY_FROM group by *
```

Another convenient way of pulling data is using a IPython notebook and/or performing
a HTTP request with 'curl' to obtain a CSV file. You can request the whole time series
or select, for example, the past 2 days of data:

```
curl -H "Accept: application/csv" -G 'https://$YOURSERVER:8086/query' --insecure --data-urlencode "db=$YOUR_DB" -u "$USER:PASSWD" --data-urlencode "q=select * from \"sensenet-test\" where time >= now() - 2d" > db-dump.csv
```

For more info, check out the [query language documentation](https://docs.influxdata.com/influxdb/v1.7/query_language/database_management).

## TODO

* Improve the documentation
* Complete 'ansible' playbooks
* Test alternatives to 'Influx DB' (given its proprietary HA components)

---
Sign-off: LFRM, 02-02-2019
