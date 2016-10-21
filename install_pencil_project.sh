#!/bin/bash
pkg_name="pencil-prototyping"
pkg_ok=""
pkg_version=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ -z "$pkg_version" ] || [ "" == "$pkg_ok" ] || [ "2.0.18" != "$pkg_version" ]; then
 	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm pencil-prototyping-2.0.18-ubuntu-all.deb
	curl -O -J -L https://github.com/prikhi/pencil/releases/download/v2.0.18/pencil-prototyping-2.0.18-ubuntu-all.deb
	dpkg -i pencil-prototyping-2.0.18-ubuntu-all.deb
	apt-get install -f -y
fi
