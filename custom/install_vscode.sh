#!/bin/bash
pkg_name="code"
pkg_ok=""
pkg_version=""
echo "---   $pkg_name installation."
pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $pkg_name|grep "install ok installed")
pkg_version=$(dpkg-query -W --showformat='${Version}\n' $pkg_name)
echo Checking for $pkg_name: $pkg_ok $pkg_version
if [ -z "$pkg_ok" ] || [ "" == "$pkg_ok" ]; then
	echo "No $pkg_name. Setting up $pkg_name."
	cd /tmp

	rm code.deb
	curl -O -J -L -o vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
  mv ?LinkID=760868 vscode.deb
	dpkg -i code.deb
	apt-get install -f -y
fi
