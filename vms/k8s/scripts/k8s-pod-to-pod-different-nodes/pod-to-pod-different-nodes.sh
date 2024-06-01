# Apply the 2 pods in different nodes
kubectl apply -f /vagrant/workloads/pod-to-pod-different-nodes

# Shw the routing table on the controlplane
# Check the route that leaves the controlplane
# route -n

# Exec into the netshoot-pod and run a curl to the nginx pod
# kubectl exec -it netshoot-pod -- bash

# Capture traffic on eth1 in node01
# sudo tshark -i eth1 -V -Y http
