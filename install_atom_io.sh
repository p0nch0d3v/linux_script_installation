#!/bin/bash
pkg_name="atom"
pkg_ok=""
pkg_version=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ -z "$pkg_version" ] || [ "" == "$pkg_ok" ] || [ "1.10.2" != "$pkg_version" ]; then
 	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm atom-amd64.deb
	curl -O -J -L https://atom-installer.github.com/v1.10.2/atom-amd64.deb -o atom-amd64.deb
	dpkg -i atom-amd64.deb
	apt-get install -f -y
fi
