#!/bin/bash
pkg_name="dropbox"
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ]; then
 	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm dropbox_2015.10.28_amd64.deb.deb
	curl -O -J -L https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb
	dpkg -i dropbox_2015.10.28_amd64.deb
	apt-get install -f -y
fi