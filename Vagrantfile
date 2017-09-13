# -*- mode: ruby -*-
# vi: set ft=ruby :

# Add the 'ol74' box with the following command: 
# vagrant box add --name ol74 http://yum.oracle.com/boxes/oraclelinux/ol74/ol74.box

Vagrant.configure(2) do |config|
  config.vm.box = "ol74"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  
  config.vm.provider "virtualbox" do |vb|
      vb.memory = 2560
      vb.cpus = 2
  end
  
  config.vm.define "mysqlserver" do |mysqlserver|
    mysqlserver.vm.hostname = "vmmysqlserver"
    mysqlserver.vm.network :forwarded_port, host: 23306, guest: 23306
    mysqlserver.vm.network :forwarded_port, host: 23307, guest: 23307
    mysqlserver.vm.network :forwarded_port, host: 23308, guest: 23308
    
    mysqlserver.vm.provision :shell, path: "https://raw.githubusercontent.com/alastori/mysql57-ol74/master/download-git-repo.sh", privileged: true
    mysqlserver.vm.provision :shell, path: "https://raw.githubusercontent.com/alastori/mysql57-ol74/master/provision-mysql-yum-repo-el7.sh", privileged: true
    mysqlserver.vm.provision :shell, path: "https://raw.githubusercontent.com/alastori/mysql57-ol74/master/provision-mysql-community-57-el7-yum.sh", privileged: true

  end  
  
  config.ssh.insert_key = false
  
end
