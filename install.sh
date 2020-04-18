#!/bin/sh
sudo rm -rf /var/tmp/minikube
sudo rm -rf /var/lib/minikube
sudo rm -rf /var/lib/kubelet
sudo rm -rf $HOME/.minikube
sudo rm -rf $HOME/.kube
sudo apt install conntrack
FILE=/etc/resolv.conf
if [ ! -f "/usr/local/bin/kubectl" ]; then
    curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
    chmod +x ./kubectl
    sudo mv ./kubectl /usr/local/bin/kubectl
fi
if [ ! -f "/usr/local/bin/minikube" ]; then
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
    sudo mv ./minikube /usr/local/bin/minikube
fi
sudo minikube start --vm-driver=none --apiserver-ips 127.0.0.1 --apiserver-name localhost --apiserver-port 51928
sudo chown -R $USER $HOME/.kube $HOME/.minikube
