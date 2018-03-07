#!/bin/bash
pkg_name="hipchat"
pkg_ok=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
	rm /etc/apt/sources.list.d/atlassian-hipchat.list
	echo "deb http://downloads.hipchat.com/linux/apt stable main" >> /etc/apt/sources.list.d/atlassian-hipchat.list
	aptitude update -y
	aptitude install $pkg_name
fi
