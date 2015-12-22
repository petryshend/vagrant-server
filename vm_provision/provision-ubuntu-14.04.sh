#!/usr/bin/env bash

# Intended for Ubuntu 14.04 (Trusty)

sudo su

# Update Ubuntu
apt-get update

# Adjust timezone to be Phoenix
# ln -sf /usr/share/zoneinfo/America/Phoenix /etc/localtime

echo "----- Provision: Installing htop..."
apt-get install -y htop

echo "----- Provision: Installing curl..."
apt-get install -y curl

echo "----- Provision: Installing git..."
apt-get install -y git

apt-get install -y software-properties-common

echo "----- Provision: Adding php5.6 repo..."
add-apt-repository -y ppa:ondrej/php5-5.6

apt-get update

echo "----- Provision: Installing python-software-properties..."
apt-get install -y python-software-properties

apt-get update

echo "----- Provision: Installing php5.6..."
apt-get install -y php5

echo "----- Provision: Installing php5-pgsql..."
apt-get install -y php5-pgsql

echo "----- Provision: Setting up composer..."
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

mkdir /vagrant/sites

echo '<h1>Fuck YEAH!</h1>' > /vagrant/sites/index.php

echo "----- Provision: Installing apache..."
apt-get install -y apache2 apache2-utils

cp /vagrant/vm_provision/hostfile /etc/apache2/sites-enabled/000-default.conf

echo "----- Provision: Installing postgresql..."
apt-get install -y postgresql postgresql-contrib


# echo "ServerName localhost" > "/etc/apache2/conf-available/fqdn.conf"
# a2enconf fqdn
# a2enmod rewrite
# a2dissite 000-default.conf

# echo "----- Provision: Setup /var/www to point to /vagrant ..."
# rm -rf /var/www
# ln -fs /vagrant /var/www

# Apache / Virtual Host Setup
# echo "----- Provision: Install Host File..."
# cp /vagrant/vm_provision/hostfile /etc/apache2/sites-available/project.conf
# a2ensite project.conf

# Cleanup
apt-get -y autoremove

# Restart Apache
echo "----- Provision: Restarting Apache..."
service apache2 restart