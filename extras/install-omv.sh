#!/bin/bash -e

# this is a useful script for getting your centos-7.x ci infra setup, based on:
# https://ttboj.wordpress.com/2015/08/11/vagrant-and-oh-my-vagrant-on-rhel7/

cat /etc/redhat-release | grep CentOS	# check this is a CentOS machine
sudo yum install -y gcc ruby-devel libvirt-devel libvirt qemu-kvm wget
sudo systemctl start libvirtd.service
wget https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4_x86_64.rpm
sudo yum install -y vagrant_1.7.4_x86_64.rpm
vagrant plugin install vagrant-libvirt
wget https://copr.fedoraproject.org/coprs/purpleidea/vagrant-libvirt/repo/epel-7/purpleidea-vagrant-libvirt-epel-7.repo
sudo cp -a purpleidea-vagrant-libvirt-epel-7.repo /etc/yum.repos.d/
sudo yum install -y vagrant-libvirt	# noop plugin for oh-my-vagrant dependency
wget https://copr.fedoraproject.org/coprs/purpleidea/oh-my-vagrant/repo/epel-7/purpleidea-oh-my-vagrant-epel-7.repo
sudo cp -a purpleidea-oh-my-vagrant-epel-7.repo /etc/yum.repos.d/
sudo yum install -y oh-my-vagrant
. /etc/profile.d/oh-my-vagrant.sh	# logout/login or source
yes | omv init	# install plugins
