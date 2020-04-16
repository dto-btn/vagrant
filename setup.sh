#!/bin/bash

echo "----- Upgrade OS and cleanup ------"
echo "set grub-pc/install_devices /dev/sda" | debconf-communicate
apt update
apt -y upgrade
apt -y install --install-recommends linux-generic
apt -y autoremove

echo "----- Docker ------"
wget -qO- https://get.docker.com/ | sh
usermod -aG docker vagrant

echo "----- kubectl ------"
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl
echo 'source <(kubectl completion bash)' >> /home/vagrant/.bashrc

echo "----- k3d ------"
wget -q -O - https://raw.githubusercontent.com/rancher/k3d/master/install.sh | bash
usermod -aG docker vagrant

echo "----- git ------"
apt -y install git

echo "----- Skaffold ------"
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
chmod +x ./skaffold
mv ./skaffold /usr/local/bin

echo "----- Helm ------"
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

echo "----- kubectx/kubens ------"
apt -y install pkg-config
git clone https://github.com/ahmetb/kubectx.git /home/vagrant/.kubectx
COMPDIR=$(pkg-config --variable=completionsdir bash-completion)
ln -sf /home/vagrant/.kubectx/completion/kubens.bash $COMPDIR/kubens
ln -sf /home/vagrant/.kubectx/completion/kubectx.bash $COMPDIR/kubectx
cat << FOE >> /home/vagrant/.bashrc
#kubectx and kubens
export PATH=~/.kubectx:\$PATH
FOE
