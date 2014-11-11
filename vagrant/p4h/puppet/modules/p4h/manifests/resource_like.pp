class p4h::resource_like( $path ) {
    file { $path:
        ensure => file,
        content => "This is resource-like.\n",
    }
}


include resource_like
