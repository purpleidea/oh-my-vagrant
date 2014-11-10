define p4h::prep7_bar($user = $title, $content) {

    file { "/home/${user}/bar.txt":
        ensure => file,
        content => $content,
        mode => 0644,
        owner => $user,
        require => User[$user],
    }
}

# vim: ts=8
