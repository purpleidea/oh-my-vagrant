# *Oh-My-Vagrant*: This is: Oh My Vagrant!

![Oh My Vagrant!](https://raw.githubusercontent.com/purpleidea/oh-my-vagrant/master/art/omv.png)

[![Build Status](https://secure.travis-ci.org/purpleidea/oh-my-vagrant.png?branch=master)](http://travis-ci.org/purpleidea/oh-my-vagrant)
[![Documentation](https://img.shields.io/docs/markdown.png)](DOCUMENTATION.md)
[![IRC](https://img.shields.io/irc/%23ohmyvagrant.png)](https://webchat.freenode.net/?channels=#ohmyvagrant)
[![Jenkins](https://img.shields.io/jenkins/status.png)](https://ci.centos.org/job/purpleidea-oh-my-vagrant/)
[![COPR](https://img.shields.io/copr/builds.png)](https://copr.fedoraproject.org/coprs/purpleidea/oh-my-vagrant/)

## Documentation:
Please see: [DOCUMENTATION.md](DOCUMENTATION.md) or [PDF](https://pdfdoc-purpleidea.rhcloud.com/pdf/https://github.com/purpleidea/oh-my-vagrant/blob/master/DOCUMENTATION.md).

## Questions:
Come join us in [#ohmyvagrant](https://webchat.freenode.net/?channels=#ohmyvagrant) on Freenode!

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
* There are a number of published articles about this environment:
  * [https://ttboj.wordpress.com/2014/09/03/introducing-oh-my-vagrant/](https://ttboj.wordpress.com/2014/09/03/introducing-oh-my-vagrant/)
  * [https://ttboj.wordpress.com/2015/04/08/sharing-dev-environments-with-oh-my-vagrant/](https://ttboj.wordpress.com/2015/04/08/sharing-dev-environments-with-oh-my-vagrant/)
  * [https://ttboj.wordpress.com/2015/04/20/docker-containers-in-oh-my-vagrant/](https://ttboj.wordpress.com/2015/04/20/docker-containers-in-oh-my-vagrant/)
  * [https://ttboj.wordpress.com/2015/05/02/kubernetes-clusters-with-oh-my-vagrant/](https://ttboj.wordpress.com/2015/05/02/kubernetes-clusters-with-oh-my-vagrant/)
  * [https://ttboj.wordpress.com/2015/06/12/a-super-privileged-puppet-container/](https://ttboj.wordpress.com/2015/06/12/a-super-privileged-puppet-container/)
  * [https://ttboj.wordpress.com/2015/07/08/oh-my-vagrant-mainstream-mode-and-copr-rpms/](https://ttboj.wordpress.com/2015/07/08/oh-my-vagrant-mainstream-mode-and-copr-rpms/)
  * [https://ttboj.wordpress.com/2015/08/11/vagrant-and-oh-my-vagrant-on-rhel7/](https://ttboj.wordpress.com/2015/08/11/vagrant-and-oh-my-vagrant-on-rhel7/)
  * [https://ghantoos.org/2015/12/20/how-to-setup-run-oh-my-vagrant-on-debian-with-libvirt-and-kvm/](https://ghantoos.org/2015/12/20/how-to-setup-run-oh-my-vagrant-on-debian-with-libvirt-and-kvm/)
* There are some screencasts available:
  * [https://dl.fedoraproject.org/pub/alt/purpleidea/screencasts/oh-my-vagrant-extern-screencast.ogv](https://dl.fedoraproject.org/pub/alt/purpleidea/screencasts/oh-my-vagrant-extern-screencast.ogv)
  * [https://dl.fedoraproject.org/pub/alt/purpleidea/screencasts/oh-my-vagrant-docker-screencast.ogv](https://dl.fedoraproject.org/pub/alt/purpleidea/screencasts/oh-my-vagrant-docker-screencast.ogv)
  * [https://dl.fedoraproject.org/pub/alt/purpleidea/screencasts/oh-my-vagrant-kubernetes-screencast.ogv](https://dl.fedoraproject.org/pub/alt/purpleidea/screencasts/oh-my-vagrant-kubernetes-screencast.ogv)

## Dependencies:
* vagrant (available in Fedora 21+, Debian)
  * [vagrant-libvirt](https://github.com/pradels/vagrant-libvirt/) (available in Fedora 21+)
  * in the meantime please test: [https://copr.fedoraproject.org/coprs/jstribny/vagrant-f20/](https://copr.fedoraproject.org/coprs/jstribny/vagrant-f20/)
* [vagrant-hostmanager](https://github.com/purpleidea/vagrant-hostmanager/)
  * you need the feat/oh-my-vagrant patches for this to work properly
  * to install them, run the script from: [extras/patch-hostmanager.sh](extras/patch-hostmanager.sh)
* [vagrant-reload](https://github.com/aidanns/vagrant-reload)
  * for the "reboot" option to work
* [puppetlabs-stdlib](https://github.com/puppetlabs/puppetlabs-stdlib) (optional, built-in)
* [puppet-module-data](https://github.com/ripienaar/puppet-module-data/) (optional, puppet >= 3.0.0, built-in)
* my [puppet-puppet](https://github.com/purpleidea/puppet-puppet) module (optional, built-in)
* my [puppet-yum](https://github.com/purpleidea/puppet-yum) module (optional, built-in)
* pandoc (for building a pdf of the documentation)

Note: If you are using VirtualBox as hypervisor, there is no need to depend on vagrant-libvirt.

## Patches:
We'd love to have your patch! Please send it by email, or as a pull request.

##

Happy hacking!
