# Start 2 alpine containers
docker network create mynet
docker run -it --rm --name cont1 --net=mynet alpine:latest
docker run -it --rm --name cont2 --net=mynet alpine:latest

# Exec into one of them and check the arp cache.
# Check the arp cache
arp -vn

# Delete the arp cache
sudo arp -d $someAddress

# Inspect the arp traffic on the bridge
sudo tcpdump -i $bridgeIface
