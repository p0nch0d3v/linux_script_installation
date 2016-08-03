#!/bin/bash
pkg_name="sublime-text"
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm sublime-text_build-3114_amd64.deb
	curl -O -J -L https://download.sublimetext.com/sublime-text_build-3114_amd64.deb
	dpkg -i sublime-text_build-3114_amd64.deb
	apt-get install -f -y
fi