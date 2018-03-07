#!/bin/bash

echo "---   Development packages installation."

packages=()
packages+=('meld')
packages+=('mysql-workbench')

packages_to_install=""

for i in ${packages[@]}
do
	packages_to_install+=$i
	packages_to_install+=" "
done 

aptitude install $packages_to_install -y
