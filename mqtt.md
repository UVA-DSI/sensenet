# Mosquitto MQTT broker

We use SSL for communicating between MCUs and servers
using MQTT, a light-weight protocol for transmitting
sensor data. 

After generating the certs for the servers with 
'Lets Encrypt', we can test the SSL communication 
with the following command:

```
mosquitto_sub -h example.org -t '#' -p 8883 --capath /etc/ssl/certs -u USER -P PASSWD
```

For posting on a topic, use the follwing command for testing purposes:

```
mosquitto_pub -h example.org -t test -m "hello world" -p 8883 --capath /etc/ssl/certs -u USER -P PASSWD
```

The following lines must be passwd to 'mosquitto.conf' 
for setting up SSL:

```
listener 8883
certfile /etc/letsencrypt/live/example.org/fullchain.pem
cafile /etc/letsencrypt/live/example.org/ca.pem
keyfile /etc/letsencrypt/live/example.org/privkey.pem
```

This is how we obtain the broker cert fingerprint to use
with the SSL client on the MCU (ESP, Yun, etc.):

```
openssl x509 -noout -in /etc/letsencrypt/live/example.org/cert.pem -fingerprint
```
 
--
Sign-off: LFRM, 06-20-2019
