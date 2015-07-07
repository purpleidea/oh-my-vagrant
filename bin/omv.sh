#!/usr/bin/bash

# This is: Oh My Vagrant!
# Copyright (C) 2012-2015+ James Shubin
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

vagrantdir="$HOME/code/oh-my-vagrant/vagrant/"	# this should be set at install
projectdir="`pwd`"	# default to where we are
args=$@

if [ "$1" = '' ] || [ "$1" = '-h' ] || [ "$1" = '--help' ]; then
        echo -e "Usage: ./"`basename $0`" --help | init [dir] | <vagrant cmd>"
fi

# initialize a new omv project (if called with $2 it puts mess in that folder!)
if [ "$1" = 'init' ]; then
	args='status'
	if [ "$2" != '' ]; then
		mkdir -p "$projectdir/$2"
		ln -s "$2/omv.yaml" 'omv.yaml'	# relative, not absolute symlink!
		args="--omv-folder=$2 $args"
	fi
fi

omvsearch=$projectdir
# search upwards for omv.yaml
while [ "$omvsearch" != "/" ]; do
	if [ -e "$omvsearch/omv.yaml" ]; then
		projectdir="$omvsearch"	# found one!
		break
	fi
	omvsearch=`dirname "$omvsearch"`
done

# this is where the magic happens...
VAGRANT_CWD="$vagrantdir" VAGRANT_DOTFILE_PATH="$projectdir/.vagrant/" vagrant $args
