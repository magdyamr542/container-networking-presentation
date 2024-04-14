# Create the namespace and veth pairs
source /vagrant/scripts/namespace-veth.sh

# DNAT to <ip of namespace>:<port of python program>
sudo iptables -t nat -A OUTPUT -p tcp --dport 8080 -j DNAT --to-destination 172.12.0.12:1234
