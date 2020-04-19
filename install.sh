#!/bin/sh
sudo rm -rf /var/tmp/minikube
sudo rm -rf /var/lib/minikube
sudo rm -rf /var/lib/kubelet
sudo rm -rf $HOME/.minikube
sudo rm -rf $HOME/.kube
sudo apt install conntrack
FILE=/etc/resolv.conf
if [ ! -f "/usr/local/bin/kubectl" ]; then
    ./install_kubectl.sh
fi
if [ ! -f "/usr/local/bin/minikube" ]; then
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
    sudo mv ./minikube /usr/local/bin/minikube
fi
sudo minikube start --vm-driver=none --apiserver-ips 127.0.0.1 --apiserver-name localhost --apiserver-port 51928
sudo chown -R $USER $HOME/.kube $HOME/.minikube
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-rc7/aio/deploy/recommended.yaml
kubectl apply -f dashboard-adminuser.yaml
kubectl apply -f role-dashboard-adminuser.yaml
kubectl -n kubernetes-dashboard patch svc kubernetes-dashboard  -p '{"spec": {"type": "NodePort", "externalIPs":["192.168.1.135"]}}'
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}')
sudo minikube -n kubernetes-dashboard service kubernetes-dashboard --url
