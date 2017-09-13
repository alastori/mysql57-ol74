#!/bin/bash

#Bash script to provision MySQL public YUM repository in Enterprise Linux 7.x
#Check if $REPO_RPM_URL is updated at http://dev.mysql.com/downloads/repo/yum/

#Modify these variables as you wish
DIR_TO_DOWNLOAD=/opt/mysql/packages
REPO_RPM_URL=http://dev.mysql.com/get/mysql57-community-release-el7-9.noarch.rpm 

set -e    # stop script execution on any error

mkdir -p $DIR_TO_DOWNLOAD

#Next lines install MySQL YUM repository from mysql.com
echo "Downloading YUM repo..."
cd $DIR_TO_DOWNLOAD
wget $REPO_RPM_URL
echo "Installing YUM repo..."
yum -y localinstall mysql57-community-release-el7*.noarch.rpm
echo "Listing enabled repos for mysql..."
yum repolist enabled | grep mysql

#You can enable/disable repos with:
#yum-config-manager --disable mysql56-community
#yumconfig-manager ---enable mysql57-community
