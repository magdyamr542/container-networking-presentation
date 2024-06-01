# Start 2 servers from different directories
mkdir backend-1234 && touch backend-1234/1234
mkdir backend-1235 && touch backend-1235/1235

python3 -m http.server --bind 127.0.0.1 1234
python3 -m http.server --bind 127.0.0.1 1235

# DNAT from :8080 to 127.0.0.1:1234 or 127.0.0.1:1235
sudo iptables -t nat -A OUTPUT -p tcp --dport 8080 -m statistic --mode random --probability 0.5 -j DNAT --to-destination 127.0.0.1:1234
sudo iptables -t nat -A OUTPUT -p tcp --dport 8080 -j DNAT --to-destination 127.0.0.1:1235

# List the rules
# sudo iptables -t nat -L -n

# Check the tcpdump
# sudo tcpdump -i lo -n
