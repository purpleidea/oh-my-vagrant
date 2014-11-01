class motd {	# this will get put on every host...
	$url = 'https://ttboj.wordpress.com/'
	file { '/etc/motd':
		content => "This is: Oh My Vagrant! (${url})\n",
	}
}

define omv_include() {	# this is a cheap enc in puppet and used by omv

	# TODO: unfortunately we're passing data into puppet via the FACTER_
	# environment variables that vagrant generates... this is limited and
	# only allows strings without significantly more work (eg: pickle-ing)
	# this is actually a limitation of puppet and vagrant, and not of omv!!
	$params_str = getvar("::vagrant_puppet_classes_params_${name}")
	if "${params_str}" != '' {
		$params = split("${params_str}", ',')
		$yaml = inline_template("<%= r = {}; @params.each {|x| r[x] = scope.lookupvar('::vagrant_puppet_classes_values_${name}_'+x)  }; r.to_yaml %>")
		$parseyaml = parseyaml($yaml)
		$hash = {
			"${name}" => $parseyaml,
		}
		create_resources('class', $hash)

	} else {
		include "${name}"
	}
}

# puppetmaster
node puppet {

	include ::motd

	class { '::puppet::server':
		pluginsync => true,	# do we want to enable pluginsync?
		storeconfigs => true,	# do we want to enable storeconfigs?
		autosign => [
			'*',		# FIXME: this is a temporary solution
			#"*.${domain}",	# FIXME: this is a temporary solution
		],
		#allow_duplicate_certs => true,	# redeploy without cert clean
		repo => true,		# automatic repos
		shorewall => false,
		start => true,
	}

	class { '::puppet::deploy':
		path => '/vagrant/puppet/',	# puppet folder is put here...
		backup => false,		# don't use puppet to backup...
	}

	# dynamically include the list of classes for this host from omv enc...
	if "${::vagrant_puppet_classes}" != '' {
		$classes = split("${::vagrant_puppet_classes}", ',')
		omv_include { $classes:	# loop!
		}
	}
}

node default {	# all the other hosts

	include ::motd

	# TODO: we could actually define the puppet classes with omv_include :)
	class { '::puppet::client':
		#start => true,
		start => false,			# useful for testing manually...
	}

	# dynamically include the list of classes for this host from omv enc...
	if "${::vagrant_puppet_classes}" != '' {
		$classes = split("${::vagrant_puppet_classes}", ',')
		omv_include { $classes:	# loop!
		}
	}
}

