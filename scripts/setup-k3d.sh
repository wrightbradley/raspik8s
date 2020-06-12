#!/bin/bash

# Install Docker
sudo apt-get update

# Install pre-reqs
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker's Official GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker's Repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

# Add user to docker group
sudo usermod -aG docker $USER

# Download k3d
wget https://github.com/rancher/k3d/releases/download/v3.0.0-rc.2/k3d-linux-amd64
sudo cp k3d-linux-amd64 /usr/local/bin/k3d
sudo chmod +x /usr/local/bin/k3d

# Download Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
chmod +x /usr/local/bin/kubectl

sudo sysctl net.ipv4.ip_forward

# Info https://blog.oddbit.com/post/2018-03-12-using-docker-macvlan-networks/
docker network create -d macvlan -o parent=enp3s0 --subnet=192.168.0.0/21 --gateway=192.168.1.1 --ip-range=192.168.0.0/24 --aux-address='host=192.168.0.8' --aux-address='n0=192.168.0.10' --aux-address="n1=192.168.0.11" --aux-address="n2=192.168.0.12" --aux-address="n3=192.168.0.13" --aux-address="n4=192.168.0.14" --aux-address="n5=192.168.0.15" mynet

sudo ip link add mynet-shim link enp3s0 type macvlan mode bridge
sudo ip addr add 192.168.0.8/32 dev mynet-shim
sudo ip link set mynet-shim up
sudo ip route add 192.168.0.0/24 dev mynet-shim

k3d create cluster k8s --network mynet --masters 3

docker stop k3d-k8s-masterlb
docker rm k3d-k8s-masterlb
docker run --network host --env-file env.list -d --name k3d-k8s-masterlb iwilltry42/k3d-proxy:v0.0.2
export KUBECONFIG=$(k3d get kubeconfig k8s)
kubectl get nodes -o wide

# delete cluster: k3d delete cluster k8s
