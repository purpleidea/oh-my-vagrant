#!/bin/bash

# this script will install vagrant-hostmanager and patch it with the extra
# features that are needed for oh-my-vagrant until they are upstream!
# https://github.com/smdahlen/vagrant-hostmanager/pull/145

# NOTE: some users have needed the following dependencies for this script:
#
#	sudo dnf install ruby-devel libvirt-devel libxslt-devel libxml2-devel
#	gem install domain_name -v 0.5.24
#	gem install net-ssh -v '2.9.2'
#
# NOTE: it is recommended to run the 'gem install' commands as the user
# NOTE: it is recommended to pick the versions as prompted on errors...

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
