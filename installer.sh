#!/bin/bash
{
    set -e
    SUDO=''
    if [ "$(id -u)" != "0" ]; then
      SUDO='sudo'
      echo "This script requires superuser access."
      echo "You will be prompted for your password by sudo."
      # clear any previous sudo permission
      sudo -k
    fi


    # run inside sudo
    # Ask for the administrator password upfront.
	sudo -v

	# Keep-alive: update existing `sudo` time stamp until the script has finished.
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
  	set -e

  	echoerr() { echo "\$@" 1>&2; }

	if [[ ! ":\$PATH:" == *":/usr/local/bin:"* ]]; then
		echoerr "Your path is missing /usr/local/bin, you need to add this to use this installer."
		exit 1
	fi

	# clone repository
	cd /tmp
	URL="https://github.com/ngetahun/dev-setup/archive/master.zip"
	if [ \$(command -v curl) ]; then
    	curl "\$URL" | unzip
  	else
    	wget -O- "\$URL" | unzip
  	fi

	source dev-setup/.dots all
}
