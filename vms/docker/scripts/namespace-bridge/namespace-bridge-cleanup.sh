# Cleanup
sudo ip link delete br0
sudo ip netns delete ns1
sudo ip netns delete ns2

sudo iptables -t filter -D FORWARD -i br0 -j ACCEPT
sudo iptables -t filter -D FORWARD -o br0 -j ACCEPT
sudo iptables -t nat -D POSTROUTING -s 172.12.0.0/24 -j MASQUERADE
