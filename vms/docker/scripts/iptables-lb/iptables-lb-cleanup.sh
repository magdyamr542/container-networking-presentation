# Clean up
sudo iptables -t nat -D OUTPUT -p tcp --dport 8080 -m statistic --mode random --probability 0.5 -j DNAT --to-destination 127.0.0.1:1234
sudo iptables -t nat -D OUTPUT -p tcp --dport 8080 -j DNAT --to-destination 127.0.0.1:1235
