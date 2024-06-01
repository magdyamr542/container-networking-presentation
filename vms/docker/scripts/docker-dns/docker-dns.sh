# Create a network mynet
docker network create mynet

# Start a backend container
docker run -it --name backend --rm --net mynet python:3.9.19-alpine python3 -m http.server --bind 0.0.0.0 1234

# Start an alpine contianer
docker run -it --name client --rm --net mynet alpine:latest

# Exec into the client and check /etc/resolv.conf
cat /etc/resolv.conf

# Run a dns query about the backend
nslookup backend.
