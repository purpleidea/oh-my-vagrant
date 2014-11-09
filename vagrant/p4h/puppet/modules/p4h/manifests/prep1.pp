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

class p4h::prep1() {

	file { '/root/README':
		content => "##prep1
For this lesson, please do the following:
* should try installing the 'cowsay' package with puppet.

Bonus:
* Install three different packages, in three lines of code
* Install three different packages, in one line of code

Happy hacking!\n",
	}

        # Since cowsay isn't available in CentOS 7, I included sl, an even sillier program
        package { 'sl':
              ensure => present,
        }

        # Install three packages in three lines of code
        package { 'byobu': ensure => present,}
        package { 'httpd': ensure => present,}
        package { 'postgresql-server': ensure => present,}

        # Install three packages in one line of code
        package { ['mongodb-server', 'python-pymongo', 'mongodb']: ensure => present,}
}

# vim: ts=8
