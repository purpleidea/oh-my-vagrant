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

        # Part 1
        package { 'emacs':
          ensure => 'installed',
          }

        # Bonus 1
        package { 'python-pip': ensure => 'installed' }
        package { 'strace': ensure => 'installed' }
        package { 'nano': ensure => 'installed' }

        # Bonus 2
        $musthaves = [ 'mutt', 'tig', 'xedit' ]
        package { $musthaves: ensure => 'installed' }
}

# vim: ts=8
