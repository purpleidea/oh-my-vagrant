#!/bin/bash

# TODO: quicken this operation by causing an rsync directly to /etc/puppet/

# stop on any error
set -e

# put fresh files into /vagrant on puppet master
time vagrant rsync puppet

# run puppet on puppet master which syncs files from /vagrant into /etc/puppet/
time vagrant provision puppet
