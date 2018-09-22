#!/bin/bash

echo "---   Update and aptitude installation."

if which aptitude; then
    echo "---   aptitude is already installed."
else
    apt-get install aptitude -y
fi

if which dpkg; then
    echo "---   aptitude is already installed."
else
    apt-get install dpkg -y
fi

if which dpkg-query; then
    echo "---   aptitude is already installed."
else
    apt-get install dpkg-query -y
fi

read -p "Do you want to run update (y/n)? " run_update

if [ ${run_update:0:1} == 'y' ] || [ ${run_update:0:1} == 'Y' ]; then
    aptitude update -y
    aptitude safe-upgrade -y
    aptitude full-upgrade -y
fi


