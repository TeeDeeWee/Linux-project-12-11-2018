#!/bin/bash
echo "Installatie van Kubernetes."
echo "Ophalen van de package."
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
echo "Updaten van de repository."
sudo apt-get update -y
echo "Installeren van Kubernetes."
yes | sudo apt-get install kubelet kubeadm kubectl -y
echo "Swap uitzetten."
sudo swapoff -a
echo "Installatie van kubernetes testen."
sudo kubeadm init --pod-network-cidr=192.168.56.0/24 --apiserver-advertise-address=192.168.56.101