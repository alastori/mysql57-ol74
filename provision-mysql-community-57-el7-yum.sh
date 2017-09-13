#!/bin/bash

#Bash script to provision MySQL 5.7 Community via mysql.com public yum repository in Enterprise Linux 7.x
#MySQL yum repository from http://dev.mysql.com/downloads/repo/yum/ must already be installed
#Run this script as root

#Modify these variables as you wish
DIR_TO_DOWNLOAD=/opt/mysql/packages
MYSQL_PWD="Root#123"
REMOTE_USER=remote
REMOTE_PWD="Remote#123"

mkdir -p $DIR_TO_DOWNLOAD

#Next lines install MySQL Server 5.7 RC from YUM repository at mysql.com
echo "Listing enabled YUM repos for MySQL..."
yum repolist enabled | grep mysql
echo "Enable MySQL 5.7 repo just in case..."
yum-config-manager --enable mysql57-community
echo "Installing MySQL Server via YUM..."
yum -y --nogpgcheck install mysql-server

#Starting MySQL Server
echo "Starting MySQL for the first time..."
service mysqld start
sleep 8
service mysqld status

echo "Changing temporary password..."
MYSQL_TMP_PWD="$(echo "$a" | cat  /var/log/mysqld.log | grep "A temporary password is generated for root@localhost: " | sed "s|^.*localhost: ||")"
echo $MYSQL_TMP_PWD $MYSQL_PWD
mysqladmin -uroot -p"$MYSQL_TMP_PWD" password "$MYSQL_PWD"
mysql -uroot -p"$MYSQL_PWD" -e"SELECT @@hostname,@@port,@@version;"

#Creating 'remote' user
mysql -uroot -p$MYSQL_PWD -e"                                              \
CREATE USER ""'"$REMOTE_USER"'""@'%' IDENTIFIED BY ""'"$REMOTE_PWD"'"";    \
GRANT ALL PRIVILEGES ON *.* TO ""'"$REMOTE_USER"'""@'%' WITH GRANT OPTION; "
mysql -u$REMOTE_USER -p"$REMOTE_PWD" -e"SELECT USER(), CURRENT_USER();"

