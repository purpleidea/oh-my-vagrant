class motd {
	# this will get put on every host...
	$url = 'https://ttboj.wordpress.com/'
	file { '/etc/motd':
		content => "This is: Oh My Vagrant! (${url})\n",
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
}

node default {	# all the other hosts

	class { '::puppet::client':
		#start => true,
		start => false,			# useful for testing manually...
	}

	# add some puppet code here...
}

