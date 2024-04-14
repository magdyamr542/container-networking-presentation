# Check the arp cache
arp -vn

# Delete the arp cache
sudo arp -d $someAddress

# Inspect the arp traffic on the bridge
sudo tcpdump -i $bridgeIface
