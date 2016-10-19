#!/bin/bash

echo "---   Development packages installation."

packages=()
packages+=('git')
packages+=('git-flow')
packages+=('meld')
packages+=('mysql-client')
packages+=('mysql-workbench')
packages+=('nodejs')
packages+=('nodejs-legacy')
packages+=('npm')
packages+=('vim')
packages+=('python-pip')
packages+=('virtualenv')
packages+=('pylint')

packages_to_install=""

for i in ${packages[@]}
do
	packages_to_install+=$i
	packages_to_install+=" "
done 

aptitude install $packages_to_install -y