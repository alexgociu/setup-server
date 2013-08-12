#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS instance

# Enable adding PPAs

sudo apt-get install python-software-properties

# Add ppa for php5.4

sudo add-apt-repository ppa:ondrej/php5
sudo apt-get update

# Install apache2

sudo apt-get install apache2

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

# TODO setup htaccess login for dev area and force https
