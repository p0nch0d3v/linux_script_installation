#!/bin/bash


read -p "Do you want to install Development packages (y/n)? " install_dev

if [ ${install_dev:0:1} == 'y' ] || [ ${install_dev:0:1} == 'Y' ]; then

    echo "---   Development packages installation."

    options=(
        git "git" off
        git-flow "git-flow" off
        
        python2.7 "python2.7" off
        python3 "python3" off
        python-pip "python-pip" off
        virtualenv "virtualenv" off
        pylint "pylint" off

        mysql-server "mysql-server" off
        mysql-client "mysql-client" off
        mysql-workbench "mysql-workbench" off

        postgresql "postgresql" off
        postgresql-client "postgresql-client" off

        php7.2 "php7.2" off
        php7.2-mysql "php7.2-mysql" off
        php7.2-pgsql "php7.2-pgsql" off
    )
    packages_to_install=""

    cmd=(dialog --separate-output --checklist "Development packages, select packages to install:" 25 50 15)

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

