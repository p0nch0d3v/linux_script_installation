#!/bin/bash
pkg_name=""
pkg_ok=""
pkg_version=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok, Version: $pkg_version

if [ -z "$pkg_ok" ] || [ -z "$pkg_version" ] || [ "" == "$pkg_ok" ] || [[ ! "$pkg_version" =~ "0.0.0" ]]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp

	# wget -O - {key_file}.key | apt-key add -
	# echo "deb " >> /etc/apt/sources.list.d/{source}.list
	# aptitude update -y
	# aptitude install $pkg_name -y

	# rm {file}.deb
	# curl -O -J -L {link} -o {file}
	# dpkg -i {}
	# apt-get install -f -y
fi
