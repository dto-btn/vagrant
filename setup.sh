#!/bin/bash

echo "----- Upgrade OS and cleanup ------"
echo "set grub-pc/install_devices /dev/sda" | debconf-communicate
apt-get update
apt-get -y upgrade
apt-get -y install --install-recommends linux-generic
apt-get -y autoremove

echo "----- Docker ------"
wget -qO- https://get.docker.com/ | sh
usermod -aG docker vagrant

echo "----- kubectl ------"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

echo "----- k3d ------"
wget -q -O - https://raw.githubusercontent.com/rancher/k3d/master/install.sh | bash
usermod -aG docker vagrant

echo "----- git ------"
apt-get -y install git

echo "----- Skaffold ------"
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
chmod +x ./skaffold
mv ./skaffold /usr/local/bin

echo "----- Helm ------"
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
