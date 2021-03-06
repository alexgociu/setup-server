#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS instance

# Enable adding PPAs

sudo apt-get install python-software-properties

# Add ppa for php5.4

sudo add-apt-repository ppa:ondrej/php5
sudo apt-get update

# Install apache2

sudo apt-get install apache2

# Install apache-utils which contains htpasswd

sudo apt-get install apache2-utils

# Add apache to dev group, and make www accessible to devs

sudo adduser www-data dev
sudo chgrp -R dev /var/www
sudo chmod -R 775 /var/www

# Create default .htpasswd

sudo mkdir /etc/apache2/auth
sudo chgrp -R dev /etc/apache2/auth
sudo chmod -R 770 /etc/apache2/auth
touch /etc/apache2/auth/.htpasswd

# Enable ssl and rewrite modules

sudo a2enmod ssl
sudo a2enmod rewrite

# Install mysql5.5

sudo apt-get install mysql-server php5-mysql

# Activate mysql

sudo mysql_install_db

# Secure mysql

sudo /usr/bin/mysql_secure_installation

# Install php

sudo apt-get install php5 php5-fpm php5-cli php5-cgi php5-readline libapache2-mod-php5 php5-mcrypt php5-gd

# Install python (required for phpsh)

sudo apt-get install python python-setuptools python-dev ncurses-dev

# Install phpsh

git clone git://github.com/facebook/phpsh.git $HOME/phpsh
cd $HOME/phpsh
sudo python2.7 setup.py install

# Install phpunit

sudo apt-get upgrade pear
sudo pear channel-discover pear.phpunit.de
sudo pear channel-discover pear.symfony-project.com
sudo pear channel-discover components.ez.no
sudo pear channel-discover pear.symfony.com
sudo pear update-channels
sudo pear upgrade-all
sudo pear install --alldeps phpunit/PHPUnit

# TODO setup htaccess login for dev area and force https
