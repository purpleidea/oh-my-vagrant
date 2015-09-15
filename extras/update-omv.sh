#!/bin/bash

# to invalid a stale cache, and update omv you can run:
sudo dnf clean metadata --disablerepo=* --enablerepo=purpleidea-oh-my-vagrant
sudo dnf update -y oh-my-vagrant
