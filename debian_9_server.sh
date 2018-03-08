#!/bin/bash
clear
echo "--- Debian 9 Server installation."

./debian/update_source_list_9.sh
./generic/install_update.sh
./generic/install_basic.sh
