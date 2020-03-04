// WiFi + MQTT credentials
const char* ssid = "";
const char* password = "";
const char* mqtt_server = "";
const char* mqtt_clientID = "";
const char* mqtt_user = "";
const char* mqtt_passwd = "";
const short mqtt_port = 8883;

static const char ca_fingerprint[] 
  PROGMEM = "";

// root CA cert
const char ca_root[] PROGMEM = R"EOF(
-----BEGIN CERTIFICATE-----
-----END CERTIFICATE-----
)EOF";
