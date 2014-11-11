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

class p4h::lesson10() {

	file { '/root/README':
		content => "##lesson10
For this lesson, please do the following:
* Build a file with whole/frag
* Name at least one piece of software that requires this technique

Bonus:
* File a bug against a piece of software that would require this technique
** (it's usually a bug or iow, the lack of an include.d/ style feature)

Happy hacking!\n",
	}

	# XXX: write your code here...
    $target = "/tmp/concat"

    concat { $target:
        ensure => present
    }

    concat::fragment { "fragA":
        target => $target,
        content => "Part A",
        order => "01"
    }

    concat::fragment { "fragB":
        target => $target,
        content => "Part B",
        order => "10"
    }

    $alt_target = "/tmp/concat-2"
    $alt_frags = "/tmp/concat-2.d/"

    file { $alt_frags
        ensure => directory
    }

    whole { $alt_target:
        dir => $alt_frags,
        require => File[$alt_frags]
    }

}

# vim: ts=8
