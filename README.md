# *Oh-My-Vagrant*: This is: Oh My Vagrant!

[![Build Status](https://secure.travis-ci.org/purpleidea/oh-my-vagrant.png)](http://travis-ci.org/purpleidea/oh-my-vagrant)

## Documentation:
Please see: [DOCUMENTATION.md](DOCUMENTATION.md) or [PDF](https://pdfdoc-purpleidea.rhcloud.com/pdf/https://github.com/purpleidea/oh-my-vagrant/blob/master/DOCUMENTATION.md).

## Installation:
Please read the [INSTALL](INSTALL) file for instructions on getting this installed.

## Examples:
Please look in the [examples/](examples/) folder for usage. If none exist, please contribute one!

## Module specific notes:

* This was born as 'vagrant-puppet-docker-template'...
* I decided it could be more useful as a general project...
* I renamed it because the original name was dumb...
* The current name is obviously a nod to the success of the 'oh-my-zsh' project, although I'm actually a bash user :)
* It is an attempt to provide a general purpose environment to make it easier to get hacking on vagrant+puppet+docker things.
* There are still some unresolved issues, but it can be useful as reference, or as a starting point for a hacker to customize.
* An intro article about this environment is available:
  * [https://ttboj.wordpress.com/2014/09/03/introducing-oh-my-vagrant/](https://ttboj.wordpress.com/2014/09/03/introducing-oh-my-vagrant/)

## Dependencies:
* vagrant (available in Fedora 21+)
  * [https://github.com/pradels/vagrant-libvirt/](vagrant-libvirt) (available in Fedora 21+)
  * in the meantime please test: [https://copr.fedoraproject.org/coprs/jstribny/vagrant-f20/](https://copr.fedoraproject.org/coprs/jstribny/vagrant-f20/)
* [https://github.com/purpleidea/vagrant-hostmanager/](vagrant-hostmanager)
  * you need the feat/oh-my-vagrant patches for this to work properly
  * to install them, run the script from: [extras/patch-hostmanager.sh](extras/patch-hostmanager.sh)
* [puppetlabs-stdlib](https://github.com/puppetlabs/puppetlabs-stdlib) (required, built-in)
* [puppet-module-data](https://github.com/ripienaar/puppet-module-data/) (optional, puppet >= 3.0.0, built-in)
* my [puppet-puppet](https://github.com/purpleidea/puppet-puppet) module (optional, built-in)
* my [puppet-yum](https://github.com/purpleidea/puppet-yum) module (optional, built-in)
* pandoc (for building a pdf of the documentation)

Note: If you are using VirtualBox as hypervisor, there is no need to depend on vagrant-libvirt.

## Patches:
This code may be a work in progress. The interfaces may change without notice.
Patches are welcome, but please be patient. They are best received by email.
Please ping me if you have big changes in mind, before you write a giant patch.

##

Happy hacking!

