#!/bin/bash
set -e

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

cd /tmp
if [ -ne $(command -v unzip) ]; then
  sudo zypper install -n unzip
fi 

# clone repository
URL="https://github.com/ngetahun/dev-setup/archive/master.zip"
if [ $(command -v curl) ]; then
  curl -L $URL -o dev-setup.zip
  unzip dev-setup.zip
fi

source dev-setup-master/.dots all
