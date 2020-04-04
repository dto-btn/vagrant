Vagrant.configure(2) do |config|

  # Install vagrant-disksize to allow resizing the vagrant box disk.
  unless Vagrant.has_plugin?("vagrant-disksize")
    raise Vagrant::Errors::VagrantError.new, "vagrant-disksize plugin is missing. Please install it using 'vagrant plugin install vagrant-disksize' and rerun 'vagrant up'"
  end

  config.vm.box = "generic/ubuntu1804"
  config.disksize.size = '40GB'

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8443

  # Mount given path in /home/vagrant/dev
  # config.vm.synced_folder "C:\\Path\\To\\Some\\Folder", "/home/vagrant/dev"

  # Default to Hyper-V (need to run `vagrant up` from shell with admin privileges)
  config.vm.provider "hyperv" do |h|
    h.vmname = "ubuntu-bionic64"    
    h.maxmemory = 4096
    h.cpus = 2
    h.vm_integration_services = {
      guest_service_interface: true,
      time_synchronization: true
    }
  end

  # Fallback to VirtualBox if no admin privileges or Hyper-V not present
  config.vm.provider "virtualbox" do |vb|
    vb.name = "ubuntu-bionic64"    
    vb.memory = 4096
    vb.cpus = 2
  end

  config.vm.provision "shell", path: "setup.sh"

end