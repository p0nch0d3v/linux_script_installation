#!/bin/bash
clear
echo "---   Debian 8 installation."
./debian/update_source_list.sh
./generic/install_update.sh
./generic/install_basic.sh
./debian/install_complementary_debian_8.sh
./install_development.sh
./install_google_chrome.sh
./install_google_remote_desktop.sh
./install_google_talk_plugin.sh
./install_google_music_manager.sh
./install_sublime_text.sh -u
./debian/install_insync_client_debian_8.sh
./debian/install_owncloud_client_debian_8.sh
./debian/install_virtualbox_debian_8.sh
./install_hipchat.sh
./debian/install_dropbox_debian_8.sh
./install_pencil_project.sh
./install_atom_io.sh
./install_remarkable.sh