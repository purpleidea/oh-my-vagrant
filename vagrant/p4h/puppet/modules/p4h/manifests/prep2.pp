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

        # XXX: write your code here...
        user { 'poopsock':
            ensure => present,
            home => '/home/poopsock',
            managehome => true,
            shell => '/bin/bash',
            before => File['/home/poopsock/poem.txt']
        }
        file { '/home/poopsock/poem.txt':
            ensure => present,
            content => "Eye halve a spelling chequer
It came with my pea sea
It plainly marques four my revue
Miss steaks eye kin knot sea.

Eye strike a key and type a word
And weight four it two say
Weather eye am wrong oar write
It shows me strait a weigh.

As soon as a mist ache is maid
It nose bee fore two long
And eye can put the error rite
Its rare lea ever wrong.

Eye have run this poem threw it
I am shore your pleased two no
Its letter perfect awl the weigh
My chequer tolled me sew.\n"
        }

}

# vim: ts=8
