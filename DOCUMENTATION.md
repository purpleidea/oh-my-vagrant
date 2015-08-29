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
	* [Mainstream usage](#mainstream-usage)
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

The Oh-My-Vagrant project lets you describe your Vagrant configuration declaratively
in YAML, and provides a general purpose Vagrantfile that reads that configuration
and passes it to Vagrant.

##Project Description

Vagrant is great, but it has some rough edges, especially if you want your Vagrant
files to work across multiple local virt providers (e.g. VirtualBox, libvirt), and
multiple host operating systems (whether Windows, Mac OS X, or your preferred
flavour of Linux).

The Oh-My-Vagrant project provides a rich Vagrantfile that avoids (or works around)
many of those rough edges by reading in the desired configuration from a
declarative YAML syntax that allows for dynamic lists of virtual machines,
Puppet(/Ansible/Chef/Salt) integration, docker containers in each machine,
automatic DNS setup, easy box downloading, and more!

Instead of having to write complex, partially declarative pseudo-ruby code to
create and modify a Vagrant environment, you can instead do all the manipulation
simply by editing a short `omv.yaml` definition file. The provided Vagrantfile
then reads this definition to dynamically configure Vagrant. Additionally, it
integrates with code to help you run existing configuration management utilities,
kick off docker commands, and more!

For more information, start by reading and working through the introductory
[blog post](https://ttboj.wordpress.com/2014/09/03/introducing-oh-my-vagrant/).

##Setup

###What can Oh-My-Vagrant do?

Oh-My-Vagrant is designed to be able to deal with:

* Dynamic lists of named virtual machines
* Dynamic lists of numbered virtual machines
* Automatic Puppet/Ansible/Chef/Salt integration
* Automatic DNS setup
* Easy Vagrant box downloading (for certain OS choices)
* Docker container enablement in each virtual machine
* Automatic Kubernetes setup
* And much more...

###Mainstream usage
Oh-My-Vagrant now supports a "mainstream" mode. This is the most common way to
use OMV when it is installed via your package manager. You interact with it
entirely with the `omv` binary. The `omv` binary works exactly like the
`vagrant` command that you're used to, except that it works directly on the
`omv.yaml` file, and hides the Vagrantfile complexity inside a system folder.

To initialize a new OMV environment, you can run:

```bash
$ omv init
```

to automatically create an `omv.yaml` file. If you supply a path as an argument
to the init verb, then all OMV project specific files will be stored in this
sub directory, to avoid cluttering up your project root directory.

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

###Why are there multiple network interfaces created on each OMV managed host?

Each VM brought up by OMV and vagrant-libvirt typically has two interfaces by
default. The first interface on the VM (which uses DHCP) is used to initially
get a connection to vagrant, since vagrant finds the machines by looking in the
DHCP leases table in Dnsmasq. This is the only way vagrant can find the IP
address. It would be great if there was an out of band communication method,
but nothing like this exists in vagrant-libvirt at this time. After vagrant
has found the VM, it makes all of its changes over this interface using SSH.
Since the first interface requires DHCP, and because many multi host clusters
prefer a consistent (statically assigned) IP address across reboots, OMV adds a
second interface which has this statically assigned address. It also provides
DNS for this network interface via the `/etc/hosts` file.

###Why is there an extra entry in the `/etc/hosts` file on each VM?

Every VM created by OMV includes an extra entry in the `/etc/hosts` file:

```
[vagrant@omv1 ~]$ cat /etc/hosts
...
## vagrant-hostmanager-start
192.168.123.100 omv1.example.com   omv1
192.168.123.3   omv.example.com    omv
## vagrant-hostmanager-end
...
```

The `192.168.123.3   omv.example.com    omv` line represents a virtual
IP address reserved on every VM in the cluster. It's unused by default and can
be used by the developer for any purpose. It's commonly used by keepalived when
using the VM cluster to demonstrate leader election.

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

###I am seeing a similar error that mentions `hostmanager`. The error looks like:

```
$ vagrant status
There are errors in the configuration of this machine. Please fix
the following errors and try again:

Vagrant:
* Unknown configuration section 'hostmanager'.
```

You are seeing this error because OMV has certain requirements. One of which
is a plugin that can manage hostnames. In general, we want to be able to have
members of the cluster access each other via FQDN. Now, there are two ways to
do this:

1. Add a real DNS server somewhere and make sure the hosts can get to it.
2. Modify the /etc/hosts file on each host in the vagrant cluster to have a record
for all of the other machines

So, the way we can fix this error is to install the `hostmanager` plugin.

```
$ wget https://raw.githubusercontent.com/purpleidea/oh-my-vagrant/master/extras/patch-hostmanager.sh
<snip>
2015-07-01 13:11:45 (384 MB/s) - ‘patch-hostmanager.sh’ saved [1315/1315]

$ chmod +x patch-hostmanager.sh && ./patch-hostmanager.sh
Installing the 'vagrant-hostmanager' plugin. This can take a few minutes...
Installed the plugin 'vagrant-hostmanager (1.5.0)'!
Cloning into 'vagrant-hostmanager'...
remote: Counting objects: 801, done.
remote: Total 801 (delta 0), reused 0 (delta 0), pack-reused 801
Receiving objects: 100% (801/801), 132.64 KiB | 0 bytes/s, done.
Resolving deltas: 100% (465/465), done.
Checking connectivity... done.
<snip>
sent 20,583 bytes  received 319 bytes  41,804.00 bytes/sec
total size is 19,533  speedup is 0.93
Patched successfully!
```
Now you can run `vagrant status` successfully and utilize the function of the plug-in
which allows you to modify the /etc/hosts file on each host in the cluster.

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

While the reference docs for OMV itself are currently incomplete, you can get a
fair way given the main [Vagrant documentation](https://docs.vagrantup.com/) and
the assumption that if an `omv.yaml` setting matches the name of a Vagrant box
configuration setting, then that setting in the YAML provides arguments to
the corresponding call in the Vagrantfile.

####`domain`
Currently undocumented.

####`network`
Subnet (in CIDR notation) that will be used for virtual machines.
If you're using Libvirt, make sure it does not clash with the existing virtual
networks on your machine. If it does - you have to set [:namespace](#namespace)
parameter to be the same as existing network name, otherwise things will not
work.

####`image`
Vagrant box name (excluding `.box` extension) that will be used to build a
virtual machine.
If it does not exist on the system - it will be downloaded from [:boxurlprefix](#boxurlprefix).

####`boxurlprefix`
URL pointing to a location that contains Vagrant box files.
It points to https://dl.fedoraproject.org/pub/alt/purpleidea/vagrant/ by
default.

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
By default, oh-my-vagrant will create [:count](#count) number of virtual
machines, all with the same settings, and generated hostnames and IP addresses.
Using `vms` array you can define different parameters for different VMs.
Example:
```yaml
:vms:
- :name: master-vm
  :image: fedora-21
  :disks: 1
  :disksize: 10G
  :memory: 1024
  :cpus: 2
- :name: slave-vm
  :image: centos-7.1
:count: 0
```
Above configuration will create 2 virtual machines: first one will have 2
CPUs and 1G of RAM assigned, as well as additional 10G hard disk, and will be
based on the Fedora 21 image. The 2nd one will be created with the default
values (1 CPU, 512MB of RAM), and will be based on centos-7.1 image.

Have a look at [Ansible example](https://github.com/purpleidea/oh-my-vagrant/blob/master/examples/ansible.yaml)
to get an idea about how the complete configuration looks like.

**Note**: If you're using `:vms` to define custom VMs, you might want to set
`:count` parameter to zero.  If you don't do this, oh-my-vagrant will always
create `:count` extra VMs, which you might want or not, depending on your setup.
See [this comment](https://github.com/purpleidea/oh-my-vagrant/pull/122#issuecomment-136054512)
for an example situation where this might be useful.

####`namespace`
Free-form string that will be used as:

* Libvirt/VirtualBox virtual network name
* prefix for virtual machines names generation, if [:vms](#vms) array is not
  defined

If you set this to the same string as an existing network name - make sure you
also set [:network](#network) parameter correctly.

####`count`
Set this to the number of virtual machines you want oh-my-vagrant to create.
Hostnames and IP addresses will be generated automatically, and fair defaults
will be used for the VMs.
Example:
```yaml
:namespace: testing-omv
:count: 5
```
Above configuration will create 5 virtual machines: testing-omv1, testing-omv2
... testing-omv5.

See also [:vms](#vms) parameter documentation for information about how you can
define various virtual machine parameters yourself.

####`username`
Currently undocumented.

####`password`
Currently undocumented.

####`poolid`
Currently undocumented.

####`repos`
Currently undocumented.

####`unsafe`
Set this to true if you want to use KVM's unsafe cache mode. If you do this, you
will trade data integrity on your development environment's filesystem for a
noticeable speed boost. See http://libvirt.org/formatdomain.html#elementsDisks

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
