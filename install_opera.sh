#!/bin/bash
pkg_name="opera-stable"
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	wget -qO- http://deb.opera.com/archive.key | apt-key add -
	rm /etc/apt/sources.list.d/opera-stable.list
	echo 'deb http://deb.opera.com/opera-stable/ stable non-free' >> /etc/apt/sources.list.d/opera-stable.list
	aptitude update -y
	aptitude install $pkg_name -y
fi