# Vagrant
Creates an Ubuntu 18.04 VM to use as a Docker and Kubernetes development environment.

## You'll need:
* [Hyper-V](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v) or [VirtualBox](https://www.virtualbox.org/)
* [Vagrant](https://www.vagrantup.com/)

```bash
# Install plugins and create the VM
vagrant plugin install vagrant-disksize
vagrant up

# Connect to the VM
vagrant ssh

# Suspend the VM when you're finished
vagrant suspend
```

## Notes

* Hyper-V is the default provider, but will only be used if you run `vagrant up` from a shell with admin rights.
* If you want to mount a local folder in the VM, uncomment this line and set the path:
```bash
# Double slashes are needed if your host OS is Windows
config.vm.synced_folder "C:\\Path\\To\\Some\\Folder", "/home/vagrant/dev"
```
