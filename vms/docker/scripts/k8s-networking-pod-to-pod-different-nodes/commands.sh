# Run the 2 nginx pods
kubectl apply -f /vagrant/workloads/pod-to-pod-different-nodes/pods.yaml

# Check ips of the pods
kubectl get pods -o wide

# Check the routing table
route -n

# Inspect with tshark the packet received on the eth1 interface on the other node
# -V: print packet details
# -Y: filter for http requests
sudo tshark -i eth1 -V -Y http

# Bash exec to the nginx pod running on the controlplane and curl the nginx pod
kubectl exec -it netshoot-pod -- bash
curl $ipOfPod
