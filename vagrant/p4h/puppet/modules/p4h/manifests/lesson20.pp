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

class p4h::lesson20() {

	file { '/root/README':
		content => "##lesson20
For this lesson, please do the following:
* Collect duplicate resources in puppet
** This means you'll need three machines
** Of course you'll also need to be comfortable with exported resources
* Don't misuse this technique
** It's typically useful to provide 'highly available' exported types
*** It happens when you have dual primary clusters that export to a third party
**** It can also happen with N-ary clusters too :)

Bonus:
* Check that your example still works when you have three identical exports
* Make sure you wrap the exported defintions in 'plain' types where appropriate

Happy hacking!\n",
	}

	# XXX: write your code here...

}

# vim: ts=8
