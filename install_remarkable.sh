#!/bin/bash
pkg_name="remarkable"
pkg_ok=""
pkg_version=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ -z "$pkg_version" ] || [ "" == "$pkg_ok" ] || [ "1.87" != "$pkg_version" ]; then
 	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm remarkable_1.87_all.deb
	curl -O -J -L https://remarkableapp.github.io/files/remarkable_1.87_all.deb
	dpkg -i remarkable_1.87_all.deb
	apt-get install -f -y
fi
