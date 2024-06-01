# Create both namespaces
sudo ip netns add ns1
sudo ip netns add ns2

# Create veth pair for ns1
sudo ip link add veth1 type veth peer name ceth1

# Create veth pair for ns2
sudo ip link add veth2 type veth peer name ceth2

# Connect veth1, veth2 to ns1 and ns2
sudo ip link set veth1 netns ns1
sudo ip link set veth2 netns ns2

# Configure veth1 in ns1 with ip 172.12.0.11
sudo ip netns exec ns1 ip addr add 172.12.0.11/24 dev veth1
sudo ip netns exec ns1 ip link set veth1 up

# Configure veth2 in ns2 with ip 172.12.0.12
sudo ip netns exec ns2 ip addr add 172.12.0.12/24 dev veth2
sudo ip netns exec ns2 ip link set veth2 up

# Bring ceth1 and ceth2 up
sudo ip link set ceth1 up
sudo ip link set ceth2 up

# Create the bridge br0
sudo ip link add name br0 type bridge

# Connect ceth1, ceth2 to the bridge
sudo ip link set dev ceth1 master br0
sudo ip link set dev ceth2 master br0

# Configure the bridge with ip 172.12.0.1
sudo ip addr add 172.12.0.1/24 dev br0
sudo ip link set br0 up

# Set the bridge to be the default gateway in ns1, ns2
sudo ip netns exec ns1 ip route add default via 172.12.0.1
sudo ip netns exec ns2 ip route add default via 172.12.0.1

# Enable the bridge to forward connections
sudo iptables -t filter -A FORWARD -i br0 -j ACCEPT
sudo iptables -t filter -A FORWARD -o br0 -j ACCEPT

# Make the bridge do source nat when communicating with the outside world
sudo iptables -t nat -A POSTROUTING -s 172.12.0.0/24 -j MASQUERADE
