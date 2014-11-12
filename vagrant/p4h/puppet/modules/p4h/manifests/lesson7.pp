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

class p4h::lesson7() {

	file { '/root/README':
		content => "##lesson7
For this lesson, please do the following:
* Read and fool around with hiera briefly
** We'll cover this again in the data-in-modules section where it's easy to use
*** Try and pass some data into a class and have it picked up
**** Think about what constitues a sane hierarchy and what's insane...

Bonus:
* Can you think of a security issue involving using facts in your hierarchy ?
** Hint: it's disclosed in the puppet labs documentation

Level 42:
* Feel free to try out data-in-modules if you're already proficient at hiera
** And then move on to OS independent puppet

Happy hacking!\n",
	}

	# XXX: write your code here...
    $data = hiera("test_val")

    notify { "msg1":
        message => "Test value ${data}"
    }

}

# vim: ts=8
