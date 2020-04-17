#!/bin/sh
sudo minikube stop
sudo minikube delete
sudo rm -rf /var/tmp/minikube
sudo rm -rf /var/lib/minikube
sudo rm -rf /var/lib/kubelet
sudo rm -rf $HOME/.minikube
sudo rm -rf $HOME/.kube
