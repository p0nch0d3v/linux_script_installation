#!/bin/bash
pkg_name="hipchat"
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
	rm /etc/apt/sources.list.d/atlassian-hipchat.list
	echo "deb http://downloads.hipchat.com/linux/apt stable main" >> /etc/apt/sources.list.d/atlassian-hipchat.list
	aptitude update -y
	aptitude install $pkg_name
fi