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

class p4h::lesson21() {

	file { '/root/README':
		content => "##lesson21
For this lesson, please do the following:
* Run the puppet FSM (finite-state-machine) that I built
** Example code is in my puppet-fsm module, and my 'puppet-pushing' repository
* Think of a new use case for this technique

Bonus:
* Congratulate yourself for working so hard!
* You're now in the 1% of advanced puppet hackers!
* Keep hacking to help advance software freedom and 'libre' infrastructures
* I believe we (Red Hat) are in a position to become the world leaders here
* Remember to use eight-space tabs in your code
* Don't forcefully align your hash rockets with spaces
* Use GNU/Linux and not a Mac :P
* Submit patches to puppet-lint so it is less dumb
* Hang out in #p4h and help others (without directly doing their homework)
* Email {my,his,your,their}\ boss\, etc to tell them you liked this course!
* Enjoy the hack, and keep it up!

Level 42:
* Generalize my FSM code so that it can work with any other class
** It should probably use structured facts now that they exist :)
*** Help patch puppet-gluster so that it uses this to elastically grow clusters
**** Shrinking would be nice too, but this is a much harder problem to solve...

Happy hacking!\n",
	}

	# XXX: write your code here...

}

# vim: ts=8
