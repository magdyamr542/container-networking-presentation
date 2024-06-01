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

# Create the veth pair
sudo ip link add veth0 type veth peer name ceth0

# Connect the end ceth0 to the ns
sudo ip link set ceth0 netns ns1

# Set the devices up
sudo ip link set veth0 up
sudo ip netns exec ns1 ip link set ceth0 up

# Give them an ip
sudo ip netns exec ns1 ip addr add 172.12.0.12/32 dev ceth0

# Set the default route inside the namespace
sudo ip netns exec ns1 sudo ip route add default via 172.12.0.12 dev ceth0

# Set the route to the namespace in the host
sudo ip route add 172.12.0.12/32 dev veth0

# Ping it
# ping 172.12.0.12
