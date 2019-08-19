# Grafana setup

Add redirect configuration for grafana:

```
iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 3000
```
