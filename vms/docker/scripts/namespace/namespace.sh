# List namespaces
# ip netns ls

# Create the namespace ns1
sudo ip netns add ns1

# Enter the namespace
# sudo ip netns exec ns1 bash

# Note:
# Empty routing table
# Empty iptables
# Only interface is lo (down)
# route -n
# sudo iptable -t nat -L
# sudo iptable -t filter -L
# ip addr show
