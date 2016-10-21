#!/bin/bash

echo "---   Update and aptitude installation."

if which aptitude; then
    echo "---   aptitude is already installed."
else
    apt-get install aptitude -y
fi

aptitude update -y
aptitude safe-upgrade -y
aptitude full-upgrade -y
