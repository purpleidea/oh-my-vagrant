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


class p4h::prep5() {

    file { '/root/README':
        content => "##prep5
For this lesson, please do the following:
* create a simple class that creates a file, and include it here
** it will need to go in a separate file because you can't nest classes
* create a second class and include it from the first (is this ever useful?)
* include a class twice in the manifest
* one of the classes should have two parameters with default values too
** use those parameters in the text of the file that your class creates

Hint:
* the class will have to have the same module prefix as this class (p4h)
* if the class is named p4h::foo, it should exist in a foo.pp file in this dir
* remember that classes are singletons, design with that in mind

Bonus:
* include a class using the 'resource-like' definition
* create the class as part of a separate module, and include it here

Happy hacking!\n",
    }

    include simple

    class { 'resource_like':
        path => '/home/vagrant/resource_like.txt',
    }

}

# vim: ts=8
