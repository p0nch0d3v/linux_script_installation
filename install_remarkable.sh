#!/bin/bash
pkg_name="remarkable"
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ]; then
 	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm remarkable_1.87_all.deb
	curl -O -J -L wget https://remarkableapp.github.io/files/remarkable_1.87_all.deb
	dpkg -i remarkable_1.87_all.deb
	apt-get install -f -y
fi