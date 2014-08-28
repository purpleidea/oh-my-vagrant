# Makefile for pulling in git modules for Vagrant deployment
# Copyright (C) 2012-2013+ James Shubin
# Written by James Shubin <james@shubin.ca>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# NOTE: if we remove a module, it won't get purged from the destination!

# NOTE: this script can sync puppet-<module> to a specific sha1sum commit, or it
# can sync all of the repos to git master. This option can be useful for devel.

BASE = 'https://github.com/purpleidea'
MODULENAME = namespace
MODULES := \
	puppet-$(MODULENAME) \
	puppet-module-data \
	puppet-puppet \
	puppet-shorewall \
	puppetlabs-stdlib
# NOTE: set to a git commit id if we need an specific commit for vagrant builds
# NOTE: remember that new commits to master should change this to a specific id
# if they will break the vagrant build process. hopefully we don't forget this!
#SHA1SUM := master
SHA1SUM := $(shell git rev-parse --verify HEAD)	# goto whatever the main tree is at

.PHONY: all modules $(MODULENAME)
.SILENT: all modules $(MODULENAME)

all:

#
#	modules
#
# clone, and then pull
modules:
	basename `pwd` | grep -q '^modules' || exit 1	# run in a modules dir!
	for i in $(MODULES); do \
		j=`echo $$i | awk -F '-' '{print $$2}'`; \
		[ -d "$$j" ] || git clone --depth 1 $(BASE)/$$i.git $$j; \
		[ -d "$$j" ] && cd $$j && git pull; cd ..; \
	done

#
#	module
#
# just clone and pull this one
$(MODULENAME):
	basename `pwd` | grep -q '^modules' || exit 1	# run in a modules dir!
	i='puppet-$(MODULENAME)'; \
	j=`echo $$i | awk -F '-' '{print $$2}'`; \
	[ -d "$$j" ] || git clone ../../../. $$j; \
	[ -d "$$j" ] && cd $$j && git checkout master && git pull && git checkout $(SHA1SUM); cd ..

