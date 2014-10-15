#!/usr/bin/env ruby
Vagrant.configure("2") do |config|
  config.vm.hostname = "buildbox"
  config.vm.box = "ubuntu/trusty64"
  
  config.vm.provider "virtualbox" do |v|
    v.name = "fr8nex-buildbox"
    v.memory = 768
  end
  
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision.yml"
    ansible.sudo = true
  end
end
