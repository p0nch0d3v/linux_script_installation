#!/bin/bash
pkg_name="chrome-remote-desktop"
pkg_ok=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm chrome-remote-desktop_current_amd64.deb
	wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	curl -O -J -L http://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
	dpkg -i chrome-remote-desktop_current_amd64.deb
	apt-get install -f -y
fi
