# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty32"
  config.vm.hostname = "sanity-box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 8080 on the guest machine.
  # config.vm.network :forwarded_port, guest: 8080, host: 8080
  # Expose Selenium standalone server port.
  config.vm.network :forwarded_port, guest: 4444, host: 4444

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file default.pp in the manifests_path directory.
  #
  config.vm.provision :shell, path: 'bootstrap.sh', keep_color: true

  # Synced folder where the WebdriverCSS test driver configuration is stored
  # and where the pages to test are set. This allows editing of the test
  # configuration the host while testing happens on the guest.
  config.vm.synced_folder './bin', '/home/vagrant/bin'
end
