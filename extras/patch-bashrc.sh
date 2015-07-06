#!/bin/bash

# this script will patch your ~/.bashrc with some awesome addons!

if ! grep -F '.bashrc.vagrant' ~/.bashrc; then
	cp vagrant.bashrc ~/.bashrc.vagrant
	echo 'if [ -f ~/.bashrc.vagrant ]; then' >> ~/.bashrc
	echo -e "\t. ~/.bashrc.vagrant" >> ~/.bashrc
	echo 'fi' >> ~/.bashrc
	echo 'Patched successfully!'
else
	echo 'Script could not proceed automatically. Already patched?'
	exit 1
fi
