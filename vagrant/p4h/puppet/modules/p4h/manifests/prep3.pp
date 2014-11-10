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

class p4h::prep3() {

	file { '/root/README':
		content => "##prep3
For this lesson, please do the following:
* create a variable that holds your name
* create a second variable with some text that interpolates the first variable
* notify the user of the longer message, using the short variable as the name

Bonus:
* show a different message if the first variable has the name 'james'
* test your code to ensure it works if the first variable is the empty string
* lastly:
** define the variable $two = 'two'
** define the variable $twopotato to contain some value
** 'notify' out the string: 'onepotatotwopotato'
** ensure where the 'two' portion of the above string comes from the $two var

Happy hacking!\n",
	}

	# XXX: write your code here...

}

# vim: ts=8
