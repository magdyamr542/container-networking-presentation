#  Start the server
python3 -m http.server --bind 127.0.0.1 1234

# List the table rules
# sudo iptables -t nat -L -n

# DNAT from :8080 to 127.0.0.1:1234
sudo iptables -t nat -A OUTPUT -p tcp --dport 8080 -j DNAT --to-destination 127.0.0.1:1234
