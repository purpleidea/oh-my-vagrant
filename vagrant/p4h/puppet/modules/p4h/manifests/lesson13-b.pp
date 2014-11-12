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

class p4h::lesson13-b() {

	file { '/root/README':
		content => "##lesson13
For this lesson, please do the following:
* Create a type on one machine (eg: a file) as an exported resource
* Collect this type on a second machine
* Export a second type, and then override a property on collection
* Use a matching expression to filter the collection
* Think about how we can do this for dynamic, whitelisted, firewalling
* Q: At what point in the run sequence does the type actually get 'exported' ?
* Q: Can we export classes ?

Bonus:
* Export a type, that itself, when compiled, exports another type back...
* When does that second internal 'exported resource' get exported ?
* Wrap the collection part in a class or a type so it's easy to use...
* Think of a use case for this feature
* Name a shortcoming / drawback of this feature
* Convince someone to pull shorewall into RHEL (as an optional feature)

Level 42:
* Nest your exported resources and collections to the third degree
* Think of three use cases for this feature
* Try out the automatic firewalling with puppet-shorewall

Happy hacking!\n",
	}

	# XXX: write your code here...

    File <<| tag == "exported_file" |>> {
        content => "imported"
    }


}

# vim: ts=8
