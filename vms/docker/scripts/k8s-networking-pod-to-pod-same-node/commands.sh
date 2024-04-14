# Run the 2 bash pods
kubectl apply -f /vagrant/workloads/pod-to-pod/pods.yaml

# Check ips of the pods
kubectl get pods -o wide

# Check the routing table
route -n

# Inspect with tshark to see the IP packet
sudo tshark -i calice0906292e2 -V
