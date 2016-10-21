#!/bin/bash
pkg_name="opera-stable"
pkg_ok=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	wget -qO- http://deb.opera.com/archive.key | apt-key add -
	rm /etc/apt/sources.list.d/opera-stable.list
	echo 'deb http://deb.opera.com/opera-stable/ stable non-free' >> /etc/apt/sources.list.d/opera-stable.list
	aptitude update -y
	aptitude install $pkg_name -y
fi
