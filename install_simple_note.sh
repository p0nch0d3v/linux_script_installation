#!/bin/bash
pkg_name="simplenote"
pkg_ok=""
pkg_version=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ -z "$pkg_version" ] || [ "" == "$pkg_ok" ] || [ "1.0.3" != "$pkg_version" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp
	rm simplenote-1.0.3.deb
	curl -O -J -L https://github.com/Automattic/simplenote-electron/releases/download/v1.0.3/simplenote-1.0.3.deb
	dpkg -i simplenote-1.0.3.deb
	apt-get install -f -y
fi
