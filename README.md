# Vagrant
Creates an Ubuntu 18.04 VM as to use as a local Docker and Kubernetes development environment.

Get started by installing [Vagrant](https://www.vagrantup.com/), [VirtualBox](https://www.virtualbox.org/) and then running the following from the  `ubuntu-bionic64` folder:
```bash
# Install plugins and create the VM
vagrant plugin install vagrant-disksize
vagrant up

# Connect to your VM
vagrant ssh
```
If you want to mount a local folder in the VM, uncomment this line in the Vagrantfile and set the path:
```bash
# Double slashes are needed if your host OS is Windows
config.vm.synced_folder "C:\\Path\\To\\Some\\Folder", "/home/vagrant/dev"
```