# Smartcville capstone at UVA School of Data Science (2019-2020)

In this project, we explored open data sources to study environmental impact and create an "ecological 
index" to support narratives for ecological change for the city. In addition, we examined, tested, and 
deployed a pilot wireless sensor network in collaboration with the Center for Civic Innovation and the 
UVA Linklab. This project is being conducted by James Howerton and Ben Schenck with help from LFR 
Murillo, Jon Kropko, Lucas Ames, and Jon Goodall.

Here you will find the technical document for the hardware, firware, and software we developed and used
for this project.

## Cvile LoRa Network

The project took advantage of an existing LoRa network in the city of Charlottesville. This network is 
run by Smart Cville as a community resource. When we started, there were only 5 gateways. We expanded
the network, so it now counts with [12 gateways that can seen on a map here](https://www.thethingsnetwork.org/community/charlottesville/).

Our TODO list include: 1) creating a code of conduct of the community network; 2) prepare technical
documentation for future collaborators.

## Data Visualization

We are using two approaches to environmental data visualization: Grafana and Luftdaten. The first
includes the unprocessed data from our ground sensors. Luftdaten is a global network for particulate
matter sensing (PM). We use their mapping tool to visualize our data and to calculate the official
index of the US Environmental Protection Agency (EPA "Air Quality Index").

[Click here to visualize in real-time our environmental metrics (of the last 24 hours.](https://sensors.unixjazz.org/d/xUrC1m8Zz/sbox-all?from=1583213342024&to=1583299742024&orgId=1)

You can pick different time periods or select individual sensors by clicking on them, next to the graph.

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
and 'motherboard' PCBs we generated for this project. Here is picture of [our first prototype, v.0.1](),
and here is a picture of [sensor box v.0.2.]()

### How to Use the Sensorbox

The sensor boxes have been insulated with silicone coating and protected with a watertight box. It is
not, however, completely insulated as it contains holes for the sensors. Here are the elements one must
pay attention to:

* Placement: the boxes are placed at ground level (up to 10 meters), exposed to sun light, but
protected from direct rain and snow. Once it is placed in one location, do not move it.

* Wiring: here are the schematics on [how to wire the sensors to the microcontroller board.]()

* Battery: our set-up is currently not low-power, it will not last on a battery for more than a week
if there is no sun exposure. If you have sun exposure, the battery lasts for about 20 days during the
winter. It is necessary to charge the battery. [Here are the instructions to put the battery on "
Always On mode, which is ** necessary ** for its functioning in our set-up.](https://voltaicsystems.com/always-on-batteries)

## Firmware

All the code is located in the folder 'sensorbox' under the name of 'sbox0' (our first prototype).

## Data Analysis

The end goal is to use the data we collected for evaluating the health impact of compounded environmental
metrics. There are three basic directions: 1) calculating averages and displaying their geolocation; 2)
creating a geospatial model for evaluating how certain concentrations might affect different parts of 
the city and certain vulnerable groups; and 3) experiment with ML-based models for outlier detection
and sensor calibration.

For more information about data analytics, check the Jupyter notebooks we prepared under the folder: 
'notebooks'.

## Privacy & Security

One of the key goals was to introduce data science students to "open data" practices (open standards, APIs,
data practices w/ Free and Open Source software and hardware) while helping them navigate data ethics issues 
to dispel the idea that public data is exempt of ethical implications.

One of the key questions of concern for the project participants is: What are the ethical implications of 
large-scale data collection for individuals and public institutions? How should open data be gathered, 
distributed and used? How should sensor data be collected, organized, and distributed, taking into account 
individual rights to anonymity and privacy?

Our data does not include data captured from humans. GPS coordinates are not made publically avaliable: only
approximate sensor locations are being published.

## Contact and Licensing Info

Check the file AUTHORS for the list of contributors to this repository. For licensing information, check the
header of a source file or the file LICENSE in the directory of a particular resource (firmware, software,
research notebook, etc.).

__Happy Environmental Monitoring and Hardware Hacking!__
