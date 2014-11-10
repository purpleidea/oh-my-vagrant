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

class p4h::prep7() {

	file { '/root/README':
		content => "##prep7
For this lesson, please do the following:
* create two 'defined types' (aka a type)
* types can't be nested inside classes, so create them in separate files
* your types should create a file and perhaps do something else as well
* use the types twice, and make sure there's no conflict (duplicate definition)
* create a before/require dependency between a type and something else

Hint:
* remember, types aren't singletons, but their names must be unique!
* remember, types aren't functions as they don't return values
* remember, types should use their name as the point of uniqueness
** if other parameters should be unique, use them in an alias metaparam
* for a type named: p4h::bar, it will have to exist in bar.pp in this dir

Bonus:
* create some types as part of your module, which should also have classes
* explain and demonstrate (by example) why before/require are both needed

Happy hacking!\n",
	}

	notify { "about to say hello world!": }

	p4h::say_hello { "bob": hiname => "bob" }

	p4h::say_hello { "world":
		filepath => "/hello_world",
		require => Notify["about to say hello world!"]
	}

	p4h::say_goodbye { "world": byename => "world" }

}

# vim: ts=8
