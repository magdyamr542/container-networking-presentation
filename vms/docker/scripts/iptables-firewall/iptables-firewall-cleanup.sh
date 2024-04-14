# Clean up
sudo iptables -t filter -D INPUT -p tcp -s 10.0.2.15 --dport 1234 -j ACCEPT
sudo iptables -t filter -D INPUT -p tcp ! -s 10.0.2.15 --dport 1234 -j DROP
