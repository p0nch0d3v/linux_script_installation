#!/bin/bash

echo "---   Basic packages installation."

packages=()
packages+=('dpkg')
packages+=('aircrack-ng')
packages+=('cups')
packages+=('curl')
packages+=('p7zip')
packages+=('p7zip-full')
packages+=('p7zip-rar')
packages+=('gnupg')
packages+=('vim')
packages+=('git')
packages+=('wget')

packages_to_install=""

for i in ${packages[@]}
do
	packages_to_install+=$i
	packages_to_install+=" "
done 

aptitude install $packages_to_install -y

