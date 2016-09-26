#!/bin/bash
pkg_name="virtualbox-5.1"
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
	wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
	rm /etc/apt/sources.list.d/virtualbox.list
	echo 'deb http://download.virtualbox.org/virtualbox/debian jessie contrib' >> /etc/apt/sources.list.d/virtualbox.list
	aptitude update -y
	aptitude install virtualbox-5.1 -y
fi