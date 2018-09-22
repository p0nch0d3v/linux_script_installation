#!/bin/bash

read -p "Do you want to install basic packages (y/n)? " install_basic

if [ ${install_basic:0:1} == 'y' ] || [ ${install_basic:0:1} == 'Y' ]; then

    echo "---   Basic packages installation."

    options=(
        build-essential "build-essential" off
        dpkg "dpkg" off
        aircrack-ng "aircrack-ng" off
        cups "cups" off
        curl "curl" off
        p7zip "p7zip" off
        p7zip-full "p7zip-full" off
        p7zip-rar "p7zip-rar" off
        gnupg "gnupg" off
        vim "vim" off
        git "git" off
        wget "wget" off
    )

    packages_to_install=""

    cmd=(dialog --separate-output --checklist "Basic packages, select packages to install:" 25 50 15)

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

