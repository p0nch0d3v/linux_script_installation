#!/bin/bash

echo "---   Complementary packages installation."

packages=()
#packages+=('chromium')
packages+=('audacity')
packages+=('banshee')
packages+=('brasero')
packages+=('calibre')
packages+=('cheese')
packages+=('easytag')
packages+=('filezilla')
packages+=('gdebi')
packages+=('gimp')
packages+=('gparted')
packages+=('gramps')
packages+=('icedove')
packages+=('soundconverter')
packages+=('synaptic')
packages+=('terminator')
packages+=('transmission')
packages+=('vlc')
packages+=('shutter')
packages+=('shotwell')
packages+=('gthumb')
##packages+=('gstreamer0.10-plugins-ugly')
packages+=('remmina')
packages+=('bleachbit')
packages+=('keepassx')
##packages+=('skype')
packages+=('blueman')
packages+=('zeal')

packages_to_install=""

for i in ${packages[@]}
do
	packages_to_install+=$i
	packages_to_install+=" "
done 

aptitude install $packages_to_install -y
