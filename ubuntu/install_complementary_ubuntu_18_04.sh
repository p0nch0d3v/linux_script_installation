#!/bin/bash

read -p "Do you want to install extra packages (y/n)? " install_basic

if [ ${install_basic:0:1} == 'y' ] || [ ${install_basic:0:1} == 'Y' ]; then

    echo "---   Extra packages installation."

    options=(
        audacity "audacity" off
        banshee "banshee" off
        bleachbit "bleachbit" off
        brasero "brasero" off
        calibre "calibre" off
        cheese "cheese" off
        easytag "easytag" off
        filezilla "filezilla" off
        gdebi "gdebi" off
        gimp "gimp" off
        gparted "gparted" off
        gramps "gramps" off
        gthumb "gthumb" off
        keepassx "keepassx" off
        remmina "remmina" off
        shotwell "shotwell" off
        shutter "shutter" off
        soundconverter "soundconverter" off
        synaptic "synaptic" off
        terminator "terminator" off
        thunderbird "thunderbird" off
        transmission "transmission" off
        vlc "vlc" off
        zeal "zeal" off
    )
    packages_to_install=""

    cmd=(dialog --separate-output --checklist "Extra packages, select packages to install:" 25 50 15)

    choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

    for i in ${choices[@]}
    do
        pkg_ok=""
        pkg_ok=$(dpkg-query -W --showformat='${Status}\n' $i|grep "install ok installed")
        
        if [ -z "$pkg_ok" ] || [ "" == "$pkg_ok" ]; then
            packages_to_install+=$i
            packages_to_install+=" "
        fi
    done 

    if [ "" != "$packages_to_install" ]; then
        echo "Packages to install: "$packages_to_install
        aptitude install $packages_to_install -y
    fi
fi
