#!/bin/bash
pkg_name="atom"
update_arg=$1
update=0
if [ $update_arg ] && [ "-u" == $update_arg ]; then
	update=1
fi
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ] || [ $update == "1" ]; then
 	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm atom-amd64.deb
	curl -O -J -L https://atom-installer.github.com/v1.10.2/atom-amd64.deb -o atom-amd64.deb
	dpkg -i atom-amd64.deb
	apt-get install -f -y
fi
