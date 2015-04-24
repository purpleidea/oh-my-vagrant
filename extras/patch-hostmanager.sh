#!/bin/bash

# this script will install vagrant-hostmanager and patch it with the extra
# features that are needed for oh-my-vagrant until they are upstream!
# https://github.com/smdahlen/vagrant-hostmanager/pull/145

vagrant plugin list | grep -qF 'vagrant-hostmanager'
if [ $? -ne 0 ]; then
	vagrant plugin install vagrant-hostmanager
fi

vagrant plugin list | grep -qF 'vagrant-hostmanager (1.5.0)'
if [ $? -ne 0 ]; then
	echo 'Version of vagrant-hostmanager must be 1.5.0 for this script!'
	exit 1
fi

git clone https://github.com/purpleidea/vagrant-hostmanager
if [ ! -d 'vagrant-hostmanager' ]; then
	echo 'Problem cloning vagrant-hostmanager!'
	exit 1
fi

cd vagrant-hostmanager/
git checkout feat/oh-my-vagrant || (
	echo 'Problem finding branch!'
	exit 1
)

if [ -e ~/.vagrant.d/gems/gems/vagrant-hostmanager-1.5.0/lib/ ]; then
	rsync -av --delete lib/ ~/.vagrant.d/gems/gems/vagrant-hostmanager-1.5.0/lib/
fi

echo 'Patched successfully!'

