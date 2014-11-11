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

class p4h::prep4() {

    file { '/root/README':
        content => "##prep4
For this lesson, please do the following:
* create a simple inline template (erb template)
* create a template that spits out a message using the @hostname fact
* create an inline template that adds two puppet variables together
* create a file that uses the contents of one of your templates
* create one of the templates in the p4h/templates/ directory (name it sth.erb)

Bonus:
* create a template that has some light programming contained (ruby code)

Level 42:
* create a template that writes a file to the file system (is this useful?)
* create a template that spits out the value from /usr/bin/hostname system call

Happy hacking!\n",
    }

    $hello = "Hello"
    $world = "World"

    $it = inline_template("Here is a message:\n\t<%= hello %>, <%= world %>!
That is all.\n")

    file { '/root/hello_world.txt':
        ensure => file,
        content => $it,
    }

    file { '/root/hostname.txt':
        ensure => file,
        content => template("p4h/hostname.erb"),
    }

    file { '/home/vagrant/hello.rb':
        ensure => file,
        content => template("p4h/hello_world.erb"),
        mode => 755,
        owner => "vagrant",
        group => "vagrant",
    }

    file { '/home/vagrant/what_should_i_do.py':
        ensure => file,
        content => template("p4h/what_should_i_do.erb"),
        mode => 755,
        owner => "vagrant",
        group => "vagrant",
    }

    file { '/home/vagrant/executable_hostname.sh':
        ensure => file,
        content => template("p4h/executable_hostname.erb"),
        mode => 755,
        owner => "vagrant",
        group => "vagrant",
    }
}

# vim: ts=8
