define p4h::bashrc ( $user = $title, $real_name ) {
    file { "/home/$user/.bashrc":
        ensure => file,
        content => template("p4h/bashrc.erb"),
    }
}
