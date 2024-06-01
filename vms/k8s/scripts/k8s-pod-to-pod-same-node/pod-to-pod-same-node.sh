# Apply the 2 pods
kubectl apply -f /vagrant/workloads/pod-to-pod-same-node/

# Shw the routing table on node01
# route -n

# Show the traffic on one of the calico veth pairs
# sudo tcpdump -i calice0906292e2 -n
