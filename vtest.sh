#!/bin/bash -e

# test suite for oh-my-vagrant patches...
echo running vtest.sh

#sudo dnf copr enable purpleidea/oh-my-vagrant
#wget https://copr.fedoraproject.org/coprs/purpleidea/oh-my-vagrant/repo/epel-7/purpleidea-oh-my-vagrant-epel-7.repo
wget https://copr.fedoraproject.org/coprs/purpleidea/oh-my-vagrant/repo/fedora-22/purpleidea-oh-my-vagrant-fedora-22.repo
sudo cp -a purpleidea-oh-my-vagrant-fedora-22.repo /etc/yum.repos.d/
sudo yum install -y oh-my-vagrant
