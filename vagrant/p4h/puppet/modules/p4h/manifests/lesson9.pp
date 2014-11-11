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

class p4h::lesson9() {

	file { '/root/README':
		content => "##lesson9
For this lesson, please do the following:
* Explain/understand the reason we need the clean.sh.erb technique
* When is 'ensure => absent' preferable? When is it not preferable?
** (in your own words, to yourself)
* Simulate this technique, but using a directory of files in /tmp/clean/
** You can use the following interfaces
** Exists (ls_cmd): `ls /tmp/clean/$element`
** Delete (rm_cmd): `rm /tmp/clean/$element`
* Remember that you can use external languages for doing local work
** Python is recommended
*** Be careful not to metaprogram!

Bonus:
* Name three different pieces of software which probably require this technique

Happy hacking!\n",
	}

    # Was a discussion...?



}

# vim: ts=8
