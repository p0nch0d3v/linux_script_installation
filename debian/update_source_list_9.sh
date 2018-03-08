#!/bin/bash

cp /etc/apt/sources.list /etc/apt/sources.listbak
cp debian/sources_9.list /etc/apt/sources.list
#cat /etc/apt/sources.list
apt-get install deb-multimedia-keyring
