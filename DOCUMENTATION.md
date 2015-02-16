#Oh-My-Vagrant

<!--
This is: Oh My Vagrant!
Copyright (C) 2012-2015+ James Shubin
Written by James Shubin <james@shubin.ca>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
-->

##Oh-My-Vagrant by [James](https://ttboj.wordpress.com/)
####Available from:
####[https://github.com/purpleidea/oh-my-vagrant/](https://github.com/purpleidea/oh-my-vagrant/)

####This documentation is available in: [Markdown](https://github.com/purpleidea/oh-my-vagrant/blob/master/DOCUMENTATION.md) or [PDF](https://pdfdoc-purpleidea.rhcloud.com/pdf/https://github.com/purpleidea/oh-my-vagrant/blob/master/DOCUMENTATION.md) format.

####Table of Contents

1. [Overview](#overview)
2. [Project description - What the project does](#project-description)
3. [Setup - Getting started with Oh-My-Vagrant](#setup)
	* [What can Oh-My-Vagrant do?](#what-can-oh-my-vagrant-do)
	* [Simple usage](#simple-usage)
	* [Complex usage](#complex-usage)
	* [Example modules](#example-modules)
4. [Usage/FAQ - Notes on usage and frequently asked questions](#usage-and-frequently-asked-questions)
5. [Reference - Detailed reference](#reference)
	* [omv.yaml](#omv.yaml)
	* [Command line](#command-line)
	* [oh-my-vagrant.yaml](#oh-my-vagrant.yaml)
6. [Examples - Example configurations](#examples)
7. [Limitations -  Vagrant versions, OS compatibility, etc...](#limitations)
8. [Development - Background on module development and reporting bugs](#development)
9. [Author - Author and contact information](#author)

##Overview

The Oh-My-Vagrant project is a dynamic Vagrant environment that you can extend.

##Project Description

The Oh-My-Vagrant project allows for dynamic lists of virtual machines, puppet
integration, docker containers in each machine, automatic DNS setup, easy box
downloading, and more!

Instead of having to write complex, partially declarative pseudo-ruby code to
create and modify a Vagrant environment, you can instead do all the manipulation
simply by editing a short omv.yaml definition file. This magic is what the
Oh-My-Vagrant project provides. Additionally, it integrates with code to help
you automatically deploy a Puppet Master, kick off docker commands, and more!

For more information, start by reading and working through the introductory
[blog post](https://ttboj.wordpress.com/2014/09/03/introducing-oh-my-vagrant/).

##Setup

###What can Oh-My-Vagrant do?

Oh-My-Vagrant is designed to be able to deal with:

* Dynamic lists of named virtual machines
* Dynamic lists of numbered virtual machines
* Automatic Puppet Master deployment
* Automatic Puppet Master integration
* Automatic DNS setup
* Easy Vagrant box downloading (for certain OS choices)
* Docker container enablement in each virtual machine
* And much more...

###Simple usage

For most use cases, the simple usage of Oh-My-Vagrant should fulfill all your
needs. Start by recursively cloning the project, and entering the vagrant/
directory:

```bash
$ git clone --recursive https://github.com/purpleidea/oh-my-vagrant
$ cd oh-my-vagrant/vagrant/
```

In this directory (or any of the children directories), you can run typical
vagrant command line tools, which will use the powerful Vagrantfile provided.
Instead of changing the pseudo-ruby code used in the Vagrantfile, you can
instead customize the behaviour by modifying a simple omv.yaml file.

Everytime you run a vagrant command, the omv.yaml file will be read in (if
it exists) parsed, and then written out in the same location. As a result, any
erroneous, not compliant, or non parseable data you put in this file will be
lost.

If you do not have a omv.yaml template, running the ```vagrant status```
command will cause one to be generated. Play around with the settings in the
omv.yaml file, and forget about the days where small changes to your
environment, required pasting in a mess of code.

###Complex usage

The complex use case allows Oh-My-Vagrant to be used as a platform that you can
build a "module" on top of. This module can provide a homework environment, a
set of interactive classwork lessons, the definitions for a demonstration
cluster, and perhaps much more.

Steps for writing a custom module is currently undocumented. Please help
improve this documentation by submitting a patch! In the meantime, you can
refer to one of the existing Oh-My-Vagrant modules, if you're comfortable
learning by example. It's fairly straightforward, but here are some quick
pointers:

* Your module should be a separate git repo with the correct format.
* You'll need to set the omv.yaml "folder" parameter to match the name of your
module.
* Include your module folder as a git submodule, in the directory next to the
omv.yaml file provided with the Oh-My-Vagrant project. You should name your
branch _module/your_module_name_. You should keep a reference to the branch
with your module in it in this manner, and rebase your branch against the newer
git master branch as often as you can.
* It's fairly straightforward once you look at an example. If you're stuck,
your author would be happy to help out in exchange for code or documentation
patches.

###Example modules

Example modules should be added as git submodules in a branch named:
_module/your_module_name_. For example, if your module is called _gluster_,
then you should create a branch named: _module/gluster_. If you're looking for
an example module, so that you can ascertain the format, and learn what is
possible, here is a list of examples:

* [p4h](https://github.com/purpleidea/p4h)
* [puppet-pushing](https://github.com/purpleidea/puppet-pushing)

##Usage and frequently asked questions
(Send your questions as a patch to this FAQ! I'll review it, merge it, and
respond by commit with the answer.)

###Why did you start this project?

I wasted enough time making custom Vagrant environments for more than one
project. I took what I learnt about Vagrant, and generalized that in a single
project. Now I don't have to duplicate code, or waste time when I want to make
changes to my Vagrant environment.

###Do you have any tricks for using Vagrant and Vagrant-Libvirt?

I've written a bunch about Vagrant and Vagrant-Libvirt on my
[technical blog](https://ttboj.wordpress.com/). Since things have changed over
the years, more recent articles are probably more relevant, and there may be
old information which is no longer necessary. As a result, use your judgement,
and in doubt, feel free to ask. In particular, there are a few articles which
are probably still relevant, and which will be very useful. They are:

* [Vagrant vsftp and other tricks](https://ttboj.wordpress.com/2013/12/21/vagrant-vsftp-and-other-tricks/)
* [Vagrant clustered SSH and ‘screen’](https://ttboj.wordpress.com/2014/01/02/vagrant-clustered-ssh-and-screen/)

###Can I use this without puppet?

Yes, absolutely. This provides puppet integration, but it is entirely optional.
If you'd like to add integration for another configuration management system,
please send a patch.

###Something isn't working correctly, and I feel I'm missing some code...

This project has some useful dependencies which are included in the main
project as git submodules. To ensure you get all of the code, make sure you do
an initial clone with the `--recursive` flag. Example:

```git clone --recursive https://github.com/purpleidea/oh-my-vagrant/```

###Awesome work, but it's missing support for a feature and/or platform!

Since this is an Open Source / Free Software project that I also give away for
free (as in beer, free as in gratis, free as in libre), I'm unable to provide
unlimited support. Please consider donating funds, hardware, virtual machines,
and other resources. For specific needs, you could perhaps sponsor a feature!

###You didn't answer my question, or I have a question!

Contact me through my [technical blog](https://ttboj.wordpress.com/contact/)
and I'll do my best to help. If you have a good question, please remind me to
add my answer to this documentation!

##Reference
Please note that there are a number of undocumented options. For more
information on these options, please view the source at:
[https://github.com/purpleidea/oh-my-vagrant/](https://github.com/purpleidea/oh-my-vagrant/).
If you feel that a well used option needs documenting here, please contact me.

###Overview of reference
* [omv.yaml](#omv.yaml): Main configuration file.
* [Command line](#command-line): Command line parameters.
* [oh-my-vagrant.yaml](#oh-my-vagrant.yaml): User specific configuration.

###omv.yaml
Editing the omv.yaml file is the primary way of modifying your Oh-My-Vagrant
environment. If you don't have a template, running the `vagrant status` command
should cause one to get created with some sensible defaults.

####`domain`
Currently undocumented.

####`network`
Currently undocumented.

####`image`
Currently undocumented.

####`boxurlprefix`
Currently undocumented.

####`sync`
Currently undocumented.

####`folder`
Currently undocumented.

####`puppet`
Currently undocumented.

####`classes`
Currently undocumented.

####`docker`
Currently undocumented.

####`cachier`
Currently undocumented.

####`vms`
Currently undocumented.

####`namespace`
Currently undocumented.

####`count`
Currently undocumented.

####`username`
Currently undocumented.

####`password`
Currently undocumented.

####`poolid`
Currently undocumented.

####`repos`
Currently undocumented.

###Command line
The command line arguments are currently undocumented. If you'd like to help
improve these, please send a patch. They are not critical to Oh-My-Vagrant
usage, because all operations can be done by editing the omv.yaml
configuration file. Using the command line does make using Oh-My-Vagrant a lot
faster if you're constantly changing your environment. It also makes people say
"Whoa!".

####`--vagrant-help`
This option doesn't yet exist. To add it, please send in a patch!

###oh-my-vagrant.yaml
This is a user specific configuration file which typically goes in
`~/.oh-my-vagrant.yaml` or in `~/config/oh-my-vagrant.yaml` if using a sane
default xdg configuration.

####username
Currently undocumented.

####password
Currently undocumented.

##Examples
For example configurations, please consult the [examples/](https://github.com/purpleidea/oh-my-vagrant/tree/master/examples) directory in the git
source repository. It is available from:

[https://github.com/purpleidea/oh-my-vagrant/tree/master/examples](https://github.com/purpleidea/oh-my-vagrant/tree/master/examples)

##Limitations
This project will work with Vagrant version 1.6.5 and greater. It may work with
certain older versions of vagrant, but they are no longer tested. Hopefully new
versions of Vagrant don't introduce any regressions that break this project.

This project will work with Vagrant-Libvirt version 0.0.20 or greater, but
using version 0.0.23 or greater is recommended. The same disclaimer about
regressions in future versions apply.

This project is routinely tested on:

* Fedora 21+

It will probably work without incident or without major modification on:

* Fedora 20
* CentOS 5.x/6.x/7.x
* RHEL 5.x/6.x/7.x

It has not been tested by the author (but should work) on:

* Ubuntu 12.04+
* Debian 7+

It will most likely work on other GNU/Linux platforms, but testing on those
platforms has been minimal due to lack of time and resources.

Testing is community supported! Please report any issues as there are a lot of
features, and in particular, support for additional distros isn't well tested.

##Development

This is my personal project that I work on in my free time.
Donations of funding, hardware, virtual machines, and other resources are
appreciated. Please contact me if you'd like to sponsor a feature, invite me to
talk/teach or for consulting.

You can follow along [on my technical blog](https://ttboj.wordpress.com/).

To report any bugs, please file a ticket at: [https://github.com/purpleidea/oh-my-vagrant/issues](https://github.com/purpleidea/oh-my-vagrant/issues).

##Author

Copyright (C) 2012-2015+ James Shubin

* [github](https://github.com/purpleidea/)
* [&#64;purpleidea](https://twitter.com/#!/purpleidea)
* [https://ttboj.wordpress.com/](https://ttboj.wordpress.com/)

