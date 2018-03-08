#!/bin/bash

cmd=(dialog --separate-output --checklist "Bassic packages, select packages to install:" 25 50 15)
options=(dpkg "dpkg" on
	cups "cups" off
	aircrack-ng "aircrack-ng" off
	curl "curl" on
	p7zip "p7zip" on
	p7zip-full "p7zip-full" on
	p7zip-rar "p7zip-rar" on
	gnupg "gnupg" on
	vim "vim" on
	git "git" on
	wget "wget" on
)
choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

clear

packages_to_install=""

for choice in $choices
do
	packages_to_install+=$choice
	packages_to_install+=" "
done

if [ -n "$packages_to_install" ] || [ "" != "$packages_to_install" ] || [ "0" != ${#packages_to_install} ]; then
	echo ${#packages_to_install} $packages_to_install
	aptitude install $packages_to_install -y
fi
