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

class p4h::lesson18() {

	file { '/root/README':
		content => "##lesson18
For this lesson, please do the following:
* Use the Exec['again'] technique to cause a repeated execution
** If this doesn't work in omv, run it manually in a standalone vagrant box
*** Fail points if it's uncontrolled and goes off in an (infinite loop)
**** Discuss how to decide which conditions you should monitor for the notify
***** Explain why 'notify' and 'missing one' in this case aren't so bad
****** Use restraint and don't abuse the use of this technique
******* It's *almost* never useful for single machine problems

Bonus:
* Use Exec['again'] to have puppet run at least three times within < 5 min
** Elegant solutions that work for N times, or hard code a value of 3 are ok
*** Check if Exec['again'] works properly within omv+vagrant (I didn't test :P)

Level 42:
* If it does not work perfectly inside of omv, patch omv and/or Exec['again']

Happy hacking!\n",
	}

	# XXX: write your code here...

}

# vim: ts=8
