#!/bin/bash

pkg_name="nodejs"
pkg_ok=""
pkg_version=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok, Version: $pkg_version

if [ -z "$pkg_ok" ] || [ -z "$pkg_version" ] || [ "" == "$pkg_ok" ] || [[ ! "$pkg_version" =~ "6.9.4" ]]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp

	curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
	aptitude update -y
	aptitude safe-upgrade -y
	aptitude full-upgrade -y
	apt-get install -f -y
fi
