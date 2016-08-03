#!/bin/bash
pkg_name="google-chrome-stable"
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm google-chrome-stable_current_amd64.deb
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	curl -O -J -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
	dpkg -i google-chrome-stable_current_amd64.deb
	apt-get install -f -y
fi

pkg_name="google-chrome-beta"
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm google-chrome-beta_current_amd64.deb
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	curl -O -J -L https://dl.google.com/linux/direct/google-chrome-beta_current_amd64.deb
	dpkg -i google-chrome-beta_current_amd64.deb
	apt-get install -f -y
fi