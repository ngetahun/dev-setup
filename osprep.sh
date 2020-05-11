#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `osxprep.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Step 1: Update the OS and Install Xcode Tools
echo "------------------------------"
echo "Updating OSX.  If this requires a restart, run the script again."
# Install all available updates
sudo zypper update -n

sudo zypper ar -cfp 90 http://ftp.gwdg.de/pub/linux/misc/packman/suse/openSUSE_Leap_15.0/ packman

sudo zypper -n install-new-recommends
sudo zypper -n install -t pattern devel_basis
sudo zypper install gpa
sudo zypper addrepo --refresh http://http.download.nvidia.com/opensuse/leap/15.0/ NVIDIA
sudo zypper install xclip xsel
