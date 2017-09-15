MySQL 5.7 and Oracle Linux 7.4
==============================

Environment with MySQL Server 5.7 and Oracle Linux 7 using Vagrant + Virtualbox, recommended for testing or training purposes.


## Synopsis
These are files to create a environment with [MySQL Server 5.7](https://dev.mysql.com/doc/refman/5.7/en/) on [Oracle Linux 7](https://www.oracle.com/linux/index.html) using [Vagrant](https://www.vagrantup.com/) and [Virtualbox](https://www.virtualbox.org/).


## Architecture
There will be 1 single VM with 1 MySQL instance accessible externally through port 23306.


## Pre-reqs
You need to have altready installed:
- [Vagrant](https://www.vagrantup.com/downloads.html) 
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

The rest of the software will be automatically downloaded and installed. 
If you already have Vagrant and Virtualbox installed, consider upgrade them.
On Windows, Vagrant may require an updated version of [Powershell](https://docs.microsoft.com/en-us/powershell/scripting/setup/installing-windows-powershell).


## How to use
- Create a directory to be the home of your Virtual Machine;
- Download [this Vagrantfile](https://raw.githubusercontent.com/alastori/mysql57-ol74/master/Vagrantfile) to this new directory;
- Install Oracle Linux 7.4 box (image) with ```vagrant box add --name ol74 http://yum.oracle.com/boxes/oraclelinux/ol74/ol74.box```.
  - It will download Oracle Linux 7 (~410MB), so this will take several minutes to finish;
  - You can check [Oracle Boxes website](http://yum.oracle.com/boxes) for updates;
- Inside the directory, run ```vagrant up```;
  - It will start the VM and automatically download and install MySQL Server, so this will take several minutes to finish;
  - If you want install MySQL later, just start the VM with ```vagrant up --no-provision```;
  - Also the files from this Git repository will be downloaded inside the VM folder ```/vagrant```;
- Access the VM with ```vagrant ssh``` or a SSH client like Putty;
  - SSH user is ```vagrant``` and password is ```vagrant```;
  - You may need to specify a authentication private key certificate as IdentityFile (SSH auth method: private key);
  - Check where the IdentityFile is located with ```vagrant ssh-config```;
  - After successful login you can get ```root``` privileges with ```sudo su -```;
- Access MySQL;
  - Inside the VM with ```mysql -uroot -pRoot#123```;
  - Outside the VM with ```mysql -uremote -pRemote#123 --port=23306```;


## Rollback
You can destroy your entire VM with ```vagrant -f destroy```.

If you need, you can remove the data files and keep installed binaries with:

```
service mysqld stop
rm -Rf /var/lib/mysql*
rm -f /var/log/mysqld.log
rm -f /etc/my.cnf
```

