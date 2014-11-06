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

class p4h::prep2() {

	file { '/root/README':
		content => "##prep2
For this lesson, please do the following:
* create a user (name it what you want) with the puppet user type
* create a file that contains a short poem or a joke
* ensure that the file gets created after the user does

Bonus:
* create the file in the new home directory of the new created user

Happy hacking!\n",
	}

	# Create a new user
        user { 'epoe':
            ensure => 'present',
            home => '/home/epoe',
            managehome => true,
        }

        # Create a file for new user
        file { '/home/epoe/quote.txt':
            require => [ User['epoe'] ],
            owner => 'epoe',
            mode => '0644',
            content => "Those who dream by day are cognizant of many things that escape those who dream only at night.",
        }

}

# vim: ts=8
