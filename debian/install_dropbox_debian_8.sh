#!/bin/bash
pkg_name="dropbox"
pkg_ok=""
pkg_version=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ -z "$pkg_version" ] || [ "" == "$pkg_ok" ] || [ "2015.10.28" != "$pkg_version" ]; then
 	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm dropbox_2015.10.28_amd64.deb.deb
	curl -O -J -L https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb
	dpkg -i dropbox_2015.10.28_amd64.deb
	apt-get install -f -y
fi
