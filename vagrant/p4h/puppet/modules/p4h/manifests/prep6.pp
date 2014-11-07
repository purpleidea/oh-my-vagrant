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

class p4h::prep6() {

	file { '/root/README':
		content => "##prep6
For this lesson, please do the following:
* create a simple puppet module (it should sit in the folder next to this one)
* the module should contain at least one template in: <modulename>/templates
* the module should contain a conditional statement based on the template value
* include a class from the module in this class along with another type

Hint:
* to easily start a module, put all your code in <modulename>/manifests/init.pp
* this code is actually in a module! the structure looks something like this:
$ james@p4h:~/code/oh-my-vagrant/vagrant/p4h/puppet/modules (p4h)$ tree p4h/
p4h/
`-- manifests
    |-- init.pp
    |-- prep1.pp
    |-- prep2.pp
    |-- prep3.pp
    |-- prep4.pp
    |-- prep5.pp
    |-- prep6.pp
    `-- template.pp

1 directory, 8 files

Bonus:
* the module should use some of the techniques from each previous lesson
* the module should actually do something useful

Level 42:
* have the module run on a single vm in omv without the use of the p4h module
** (hint: p4h uses an omv mechanism to cause itself to run, use the same one!)

Happy hacking!\n",
	}

	# XXX: write your code here...

}

# vim: ts=8
