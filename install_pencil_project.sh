#!/bin/bash
pkg_name="pencil-prototyping"
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
echo Checking for $pkg_name: $pkg_ok
if [ "" == "$pkg_ok" ]; then
 	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm pencil-prototyping-2.0.18-ubuntu-all.deb
	curl -O -J -L https://github.com/prikhi/pencil/releases/download/v2.0.18/pencil-prototyping-2.0.18-ubuntu-all.deb
	dpkg -i pencil-prototyping-2.0.18-ubuntu-all.deb
	apt-get install -f -y
fi