define p4h::realnameuser ( $user = $title, $real_name ) {
    user { "$user":
        ensure => present,
        managehome => true,
    }

    bashrc { $user:
        real_name => $real_name,
        require => User[$user],
    }
}
