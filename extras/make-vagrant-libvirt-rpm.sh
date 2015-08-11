#!/bin/bash

echo hello > .rpmbuild/SOURCES/README
tar -C .rpmbuild/SOURCES/ -cjf .rpmbuild/SOURCES/vagrant-libvirt-noop.tar.bz2 README
# upload useless tarball to a server somewhere...
rpmbuild --define "_topdir $(pwd)/.rpmbuild" -bs .rpmbuild/SPECS/vagrant-libvirt.spec
rpmbuild --define "_topdir $(pwd)/.rpmbuild" -bb .rpmbuild/SPECS/vagrant-libvirt.spec
