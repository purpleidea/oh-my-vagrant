define p4h::p7planfile ($user = $title, $content) {
    file {"/home/${user}/.plan":
        ensure => file,
        content => $content,
        owner => $user,
        mode => 0755,
        require => User[$user]
    }
}
