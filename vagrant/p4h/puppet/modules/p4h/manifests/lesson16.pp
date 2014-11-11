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

class p4h::lesson16() {

	file { '/root/README':
		content => "##lesson16
For this lesson, please do the following:
* Read the 'Secure Secrets' blog post I wrote about this subject
** https://ttboj.wordpress.com/2014/06/06/securely-managing-secrets-for-freeipa-with-puppet/
*** Remember that friends don't let friends store secrets in puppet (or eyaml)
**** Try this out if you can, or, pull out some of my code and do a POC run

Bonus:
* Libify this technique for SSH keys
* Libify this technique for FreeIPA DM/admin password (sorry, it's built-in!)
* Integrate this with LDAP+Kerberos

Level 42:
* Libify this technique for SSL certs
** Find an 'official' CA that lets you use an API to get your cert signed!
* Convince the FreeIPA guys to finish multi-master so that it works with this!
** I forget where the RFE is or if it's only verbal, but this might be related
*** https://fedorahosted.org/freeipa/ticket/4302

Happy hacking!\n",
	}

	# XXX: write your code here...

}

# vim: ts=8
