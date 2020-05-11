#!/usr/bin/env bash

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo zypper -n install git-core
sudo zypper ar https://download.opensuse.org/repositories/devel:/tools:/scm/openSUSE_Leap_15.1/devel:tools:scm.repo
sudo zypper install -y git-extras

# Install GNU core utilities (those that come with OS X are outdated).
sudo zypper install -n coreutils


# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
sudo zypper install -n findutils

# Install some other useful utilities like `sponge`.
sudo zypper install -n moreutils

# Install Python
sudo zypper install python
sudo zypper in -y python3 python3-setuptools python3-pip


# Install ruby-build and rbenv
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# Install some CTF tools; see https://github.com/ctfs/write-ups.
zypper install aircrack-ng
zypper install bfg
zypper install binwalk
zypper install cifer
zypper install dex2jar
zypper install dns2tcp
zypper install fcrackzip
zypper install foremost
zypper install hashpump
zypper install hydra
zypper install john
zypper install netpbm
zypper install tcpreplay
zypper install sqlmap
zypper install ucspi-tcp
zypper install homezypper/x11/xpdf

zypper install pngcheck
zypper install xz
zypper install binutils
zypper install nmap
zypper install socat
zypper install tcpflow
zypper install knock
zypper install tcptraceroute

# Install other useful binaries.
zypper install ack
zypper install hub

zypper install ImageMagick
zypper install pv
zypper install lynx
zypper install lua51
zypper install p7zip
zypper install pigz
zypper install krename
zypper install rhino
zypper install tree

# Lxml and Libxslt
zypper install libxml2
zypper install libxslt

# Install Heroku
curl https://cli-assets.heroku.com/install.sh | sh
heroku update

# Install snap
# TODO: make suse version generic
sudo zypper addrepo --refresh https://download.opensuse.org/repositories/system:/snappy/openSUSE_Leap_15.0 snappy
sudo zypper --gpg-auto-import-keys refresh
sudo zypper dup --from snappy
sudo zypper install snapd
sudo systemctl enable snapd
sudo systemctl start snapd

# Development tool casks
zypper cask install virtualbox
zypper cask install vagrant

# Install Alacritty emulator
sudo snap install alacritty --classic
sudo snap install code --classic

# Misc casks
zypper install MozillaThunderbird
zypper install brave-browser


# Install Docker, which requires virtualbox
sudo zypper install docker docker-compose
sudo systemctl enable docker
sudo usermod -G docker -a $USER
sudo systemctl restart docker

