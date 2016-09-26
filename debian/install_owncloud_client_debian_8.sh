#!/bin/bash
pkg_name="owncloud-client"
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	wget http://download.opensuse.org/repositories/isv:ownCloud:desktop/Debian_8.0/Release.key
	apt-key add - < Release.key  
	rm /etc/apt/sources.list.d/owncloud-client.list
	echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Debian_8.0/ /' >> /etc/apt/sources.list.d/owncloud-client.list
	aptitude update -y
	aptitude install $pkg_name -y
fi
