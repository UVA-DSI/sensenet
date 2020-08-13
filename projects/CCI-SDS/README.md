# A LoRaWAN-Based Air Quality Sensor Network for the Public Good (2019-2020)

In this project, we evaluated, tested, and deployed a pilot wireless sensor network in collaboration 
with the Center for Civic Innovation, Smart Cville, and the UVA Linklab. This project was conducted 
by James Howerton and Ben Schenck under the mentorship of L.F.R. Murillo, Jon Kropko, Lucas Ames, and 
Jon Goodall.

Here you will find the technical document for the hardware, firware, and software we developed and used
for this project. This README is for development purposes only. 

For more information, [please visit the portfolio and access the paper "A LoRaWAN-based AQ Sensor 
Network for the Public Good" by Howerton and Schenck](https://thejimster82.github.io/CvilleAQ).

## Things Network Cville

Our project took advantage of an existing LoRa network in the city of Charlottesville. This network is 
run by Smart Cville as an open community resource. When we started, there were only 5 gateways. We expanded
the network, so it now counts with [12 gateways that can seen here](https://www.thethingsnetwork.org/community/charlottesville/).

## Data

We collected PM2.5 (ppm), PM10 (ppm), temperature (C), CO2 (ppm) and humidity (%) with 10 boxes for 
the period of five months. This data can be obtained directly from our visualization tool below, or [already 
cleaned and ready to use in this directory](https://github.com/thejimster82/CvilleAQ/tree/master/notebooks/data).

For information on how to query for data on Influxdb, please use this [notebook](https://github.com/UVA-DSI/sensenet/blob/master/projects/CCI-SDS/notebooks/influxdb-sensenet-example.ipynb). Our data is made "open" according to the ["Open Data" definition](http://opendatahandbook.org/guide/en/what-is-open-data/).

## Data Visualization

We are using two platforms to visualize the data we generated: Grafana and Luftdaten. The first
includes the unprocessed data from our ground sensors. The latter is a global network for particulate
matter sensing (PM). We use their mapping tool to visualize our data and to calculate the official
index of the US Environmental Protection Agency (EPA "Air Quality Index").

[Click here to visualize in real-time our environmental metrics (of the last 24 hours.](https://sensors.unixjazz.org/d/xUrC1m8Zz/sbox-all?from=1583213342024&to=1583299742024&orgId=1)

You can pick different time periods or select individual sensors by clicking on them, next to the graph.
Our data collection period started in February, 2020 and ended in June, 2020.

[Click here to visualize how these values map out to city locations.](https://maps.sensor.community/#13/38.0307/-78.4931)

You can select different metrics, such as (PM2.5, PM10 or check the EPA AIQ calculation) by clicking on 
the green menu at the bottom left of the map. Several zoom levels can also be selected, but the zoom
stops at #15 to avoid providing close GPS coordinates for where the environmental sensor is actually 
located.

## Hardware

We have deployed a sensor box equipped with the following hardware:

* SAMD21 microcontroller 
* LoRa RFM98 radio chip
* PMS7003 particulate matter sensor
* Sensiron SCD30 CO2 sensor
* Voltaic 1W solar panel + 4000mAh battery

The firmware can be found in the 'sensorbox' folder. The 'hardware' folder contains the connectors
and 'motherboard' PCBs we generated for this project. Here is picture of [our first prototype, v.1](images/proto_v1.jpg),
and here is another of our revised prototype [v.2](images/proto_v2.jpg). We also included more pictures  
of the hardware in the folder "images".

### How to Use the Sensor Box

The sensor boxes have been insulated with silicone coating and protected with a watertight box. It is
not, however, completely insulated as it contains holes for the sensors. Here are the elements one must
pay attention to:

* Placement: the boxes are placed at ground level (up to 10 meters), exposed to sun light, but
protected from direct rain and snow. Once it is placed in one location, write down the coordinates,
and do not move it.

* Wiring: here are the schematics on [how to wire the sensors to the microcontroller board.](images/wiring.png)

* Battery: our set-up is currently not adjusted for low-power applications, it will not last on a battery 
for more than a week if there is no sun exposure. In our experience, the 4000mAh will last for 12 days on average
without sun exposure. During the summer, however, the box does not need to be recharged if properly placed in a 
sunny spot. [Here are the instructions to put the battery on "Always On mode, which is ** necessary ** 
for its functioning in our set-up.](https://voltaicsystems.com/always-on-batteries)

## Firmware

All the code is located in the folder "sensorbox" under the name of "sbox0".

## Data Analysis

The end goal is to use the data we collected for evaluating the health impact of compounded environmental
metrics. There are three basic directions: 1) calculating averages and displaying their geolocation; 2)
creating a geospatial model for evaluating how certain concentrations might affect different parts of 
the city and certain vulnerable groups; and 3) experiment with ML-based models for outlier detection
and sensor calibration.

For more information about data analytics, check the Jupyter notebooks we prepared under the folder "notebooks".

## Commitment to Data Ethics, Privacy & Security

One of the key goals was to introduce data science students to "open data" practices (open standards, APIs,
data practices w/ Free and Open Source software and hardware) while helping them navigate data ethics issues 
to dispel the idea that public data is exempt of ethical implications.

Questions of concern for the project participants are: What are the ethical implications of 
large-scale data collection for individuals and public institutions? How should open data be gathered, 
distributed, and used? How should sensor data be collected, organized, and distributed, taking into account 
individual rights to anonymity and privacy? What qualifies as consent in our network and what are the limits
of data capture? And, finally, why we do not need an "Internet of Things" but an "Internet of People"? That is,
a network that is owned and managed by the public for the public good?

Our dataset does not include data from humans, but that does not mean it does not have ethical implications. 
Exact GPS coordinates for the location of our boxes were not made publically avaliable, only approximate sensor locations
are being published. Our commitment to openess with respect to our technologies and infrastructures does not mean
we do not value privacy rights and indiscriminate data collection. Our primary goal is to collect environmental data
whose benefit includes every breathing and living being. For our purposes, we believe it is justifiable and justified
to collect environmental data to address environmental issues and questions of environmental justice.

## Contact and Licensing Info

Check the file AUTHORS for the list of contributors to this repository. For licensing information, check the
header of a source file or the file LICENSE in the directory of a particular resource (firmware, software,
research notebook, etc.).

__Happy Environmental Monitoring and Hardware Hacking!__
