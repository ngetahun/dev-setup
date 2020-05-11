#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# postgres installation
sudo zypper addrepo http://download.opensuse.org/repositories/server:database:postgresql/openSUSE_Tumbleweed/ PostgreSQL
sudo zypper in postgresql postgresql-server postgresql-contrib
sudo zypper in postgresql-plperl postgresql-plpython postgresql-plctl
sudo systemctl enable postgresql
sudo systemctl start postgresql

# Install data stores
brew install mysql
# TODO: do this in tmp

cd /tmp
wget https://dev.mysql.com/get/mysql80-community-release-sl15-3.noarch.rpm
sudo rpm -ivh mysql80-community-release-sl15-3.noarch.rpm
sudo rpm --import /etc/RPM-GPG-KEY-mysql
sudo zypper refresh
sudo zypper install -n mysql-community-server

sudo rpm --import https://www.mongodb.org/static/pgp/server-4.2.asc
sudo zypper addrepo --gpgcheck "https://repo.mongodb.org/zypper/suse/15/mongodb-org/4.2/x86_64/" mongodb
sudo zypper -n install mongodb-org
sudo zypper install mongodb-org-4.2.6 mongodb-org-server-4.2.6 mongodb-org-shell-4.2.6 mongodb-org-mongos-4.2.6 mongodb-org-tools-4.2.6

zypper install redis

zypper addrepo https://download.opensuse.org/repositories/security:logging/openSUSE_Leap_15.1/security:logging.repo
zypper refresh
zypper install elasticsearch
