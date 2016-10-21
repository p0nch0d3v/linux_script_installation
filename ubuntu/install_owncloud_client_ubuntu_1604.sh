#!/bin/bash
pkg_name="owncloud-client"
pkg_ok=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/Ubuntu_16.04/Release.key
	apt-key add - < Release.key
	echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Ubuntu_16.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list
	aptitude update -y
	aptitude install $pkg_name -y
fi
