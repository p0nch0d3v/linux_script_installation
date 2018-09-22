#!/bin/bash
clear
echo "---   Linux Mint 19 installation."

./generic/install_update.sh
./generic/install_basic.sh
./ubuntu/install_complementary_ubuntu_18_04.sh
./generic/install_development.sh
./custom/install_google_chrome.sh

