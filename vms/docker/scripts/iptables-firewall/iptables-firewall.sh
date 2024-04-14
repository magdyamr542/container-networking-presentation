#  Start the server
python3 -m http.server --bind 127.0.0.1 1234

# Allow connections from 10.0.0.1
sudo iptables -t filter -A INPUT -p tcp -s 10.0.2.15 --dport 1234 -j ACCEPT

# Block any other connections
sudo iptables -t filter -A INPUT -p tcp ! -s 10.0.2.15 --dport 1234 -j DROP

# List the table rules
sudo iptables -t filter -L
