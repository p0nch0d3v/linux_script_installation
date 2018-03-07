#!/bin/bash
pkg_name="atom"
pkg_ok=""
pkg_version=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ -z "$pkg_version" ] || [ "" == "$pkg_ok" ]; then
 	echo "No $pkg_name. Setting up $pkg_name."
	# cd /tmp
	curl -L https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
	echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list
	apt-get update
	apt-get install atom
fi
