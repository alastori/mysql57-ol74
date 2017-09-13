#!/bin/bash

#Download repo using git client
yum -y install git
mkdir -p /vagrant
cd /vagrant
git clone https://github.com/alastori/mysql57-ol74.git
mv /vagrant/mysql57-ol74/* /vagrant
rm -Rf /vagrant/mysql57-ol74