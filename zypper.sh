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
sudo zypper install aircrack-ng
sudo zypper install bfg
sudo zypper install binwalk
sudo zypper install cifer
sudo zypper install dex2jar
sudo zypper install dns2tcp
sudo zypper install fcrackzip
sudo zypper install foremost
sudo zypper install hashpump
sudo zypper install hydra
sudo zypper install john
sudo zypper install netpbm
sudo zypper install tcpreplay
sudo zypper install sqlmap
sudo zypper install ucspi-tcp
sudo zypper install homezypper/x11/xpdf

sudo zypper install pngcheck
sudo zypper install xz
sudo zypper install binutils
sudo zypper install nmap
sudo zypper install socat
sudo zypper install tcpflow
sudo zypper install knock
sudo zypper install tcptraceroute

# Install other useful binaries.
sudo zypper install ack
sudo zypper install hub

sudo zypper install ImageMagick
sudo zypper install pv
sudo zypper install lynx
sudo zypper install lua51
sudo zypper install p7zip
sudo zypper install pigz
sudo zypper install krename
sudo zypper install rhino
sudo zypper install tree

# Lxml and Libxslt
sudo zypper install libxml2
sudo zypper install libxslt

# Install Heroku
sudo curl https://cli-assets.heroku.com/install.sh | sh
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
sudo zypper install virtualbox
sudo zypper install vagrant

# Install Alacritty emulator
sudo snap install alacritty --classic
sudo snap install code --classic

# Brave browser
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/x86_64/ brave-browser
sudo zypper install brave-browser

# Misc casks
sudo zypper install MozillaThunderbird

# Install Docker, which requires virtualbox
sudo zypper install docker docker-compose
sudo systemctl enable docker
sudo usermod -G docker -a $USER
sudo systemctl restart docker

