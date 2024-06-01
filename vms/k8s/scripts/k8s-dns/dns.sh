# List services in the kube-system ns
# You find the kube-dns service exposing port 53
kubectl get services -n kube-system

# Exec into a pod and 'cat /etc/resolv.conf'
# It points to the cluster ip of the service

# Get the pods in the kube-ns namespace and do a dns query to one of the coredns pods
kubectl get pods -n kube-system

# nslookup <full svc name> <dns resolver ip = coredns pod>
nslookup kubernetes.default.svc.cluster.local 172.16.49.69
