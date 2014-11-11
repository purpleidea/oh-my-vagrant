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
^ I would, but it's already 6:15 pm. Just throw the ruby code in the tags, using auto-trim tags as
  necessary. Also, the `` execution pseudo-operator/function thing.

Happy hacking!\n",
	}

	$hostname = inline_template("<%= @hostname %>")
    $hn_from_template = template("p4h/sth.erb")

    $var1 = 5
    $var2 = 10
    $result = inline_template("<%= @var1 + @var2 %>")

    file { "template_file":
        path        => "/tmp/template_out",
        content     => template("p4h/sth.erb"),
        ensure      => file
    }

}

# vim: ts=8
