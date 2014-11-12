# Puppet for Hackers course module by James
# Copyright (C) 2013-2014+ James Shubin
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

# README: this is a module built for use with: Oh My Vagrant!

class p4h::lesson17(
    $comment = ''
    ) {

	file { '/root/README':
		content => "##lesson17
For this lesson, please do the following:
* Try out the hiera data-in-modules technique
** Can you use it for defining types ?
*** Further complicate your life by learning the os-independent puppet part
**** It's actually quite elegant, but it's not fun for the initial module code
***** And regrettably, it makes your code look a bit less readable than before

Bonus:
* Submit a patch for Puppet-IPA or Puppet-Gluster to enhance the coverage
* Test this feature in the Puppet-IPA git master :)

Level 42:
* Port one of my existing modules to use this feature
** Pick a 'good module' (that I care about) and not something old and unloved!
* Promise to continuously test git master of one of my modules that uses this
** On a different OS than what I test/hack/devel on...
*** Better yet, convince someone in the Ubuntu community to do so...
**** I'd say 'Debian', but their wavering stance on systemd will be their death
***** http://linux.slashdot.org/story/14/11/08/1448234/joey-hess-resigns-from-debian
****** They need to go 100% systemd, ASAP, and help out with patches as needed!

Happy hacking!\n",
	}

	# XXX: write your code here...
    notify { "test":
        message => "Comment: ${comment}",
    }

}

# vim: ts=8
