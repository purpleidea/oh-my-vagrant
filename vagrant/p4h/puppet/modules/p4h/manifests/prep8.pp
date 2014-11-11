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

class p4h::prep8() {

	file { '/root/README':
		content => "##prep8
For this lesson, please do the following:
* use the exec type
** https://docs.puppetlabs.com/references/stable/type.html#exec
* use the onlyif attribute
* use the unless attribute
* use the creates attribute
* use bash to write the conditions for some of these attributes
* use the bash 'test' program (man test)
* find out which shell is used to run commands

Bonus:
* when is the fault with refreshonly and using notify/subscribe to run an exec?
* chain more than one exec together
* ensure the second requires the first to complete
* ensure that the second never errors due to an error from the first

Level 42:
* try increasing the $name var command length... what limit does it have?
* does this same limit exist when using the command attribute directly?
* how can we get around any of these limits?

Happy hacking!\n",
	}

	# XXX: write your code here...
	exec { 'touch /tmp/touchme':
          onlyif  => "test prep8 == prep8",
          unless  => 'test -e /tmp/touchme',
          creates => '/tmp/touchme',
          path    => '/usr/bin:/usr/sbin',
        }

}

# vim: ts=8
