# Apply the nginx cluster ip service + deployment
kubectl apply -f /vagrant/workloads/cluster-ip-service

# Get the services and pods
kubectl get services -o wide
kubectl get pods -o wide

# Check the iptables rules of the nat table.
# CHAIN OUTPUT
# Chain KUBE-SVC-*: acts as a load balancer
# Chain KUBE-SEP-*: stands for a service endpoint
sudo iptables -t nat -L -n >/vagrant/iptables-output.txt

# Format it from the local computer
cat iptables-output.txt | python3 iptables-output-formatter.py >iptables-output-formatted.txt

# Scale the replica to 3 pods
# Check the iptables rules again.
kubectl scale --replicas 3 deployment nginx-deployment-cluster-ip
