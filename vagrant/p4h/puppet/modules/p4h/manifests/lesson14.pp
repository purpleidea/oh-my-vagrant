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

class p4h::lesson14() {

	file { '/root/README':
		content => "##lesson14
For this lesson, please do the following:
* Build a simple two host cluster that uses this technique to run a task
** Make sure it only runs on one host, until you take the primary down
*** You can use the specially defined `vip` hostname/ipaddress for the vip
**** Using my puppet-keepalived module should make this easier
***** It also includes an automatic host/UUID exchange
* Is this a real DLM ?
** Name one edge condition to be aware of when using this feature

Bonus:
* Does it ever make sense to have more than one VIP?
** If so should they always be co-located?

Happy hacking!\n",
	}

    # The collection below causes a "duplicate resource" error.
    # file { "file1":
    #     path => "/tmp/typecollisiontest",
    #     content => "file content",
    #     ensure => file
    # }

    # File <<| tag == "exported_file" |>> {
    #     path => "/tmp/${hostname}-testfile",
    #     content => "imported-1"
    # }


    # This, however, will cause the 2nd collection to be ignored.
    # No error occurs here.
    File <<| tag == "exported_file" |>> {
        path => "/tmp/${hostname}-testfile",
        content => "imported-1"
    }

    File <<| tag == "exported_file" |>> {
        path => "/tmp/${hostname}-testfile",
        content => "imported-2"
    }


    # Lesson 14 stuff here.

}

# vim: ts=8
