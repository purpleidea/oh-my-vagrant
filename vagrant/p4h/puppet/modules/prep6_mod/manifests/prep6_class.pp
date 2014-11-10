class prep6_mod::prep6_class {

    case $architecture {
        x86_64:    { $message = "64 bit" }
        i386, x86: { $message = "32 bit" }
        default:   { $message = "Unknown arch: ${architecture}" }
    }

    file {  '/var/log/prep6':
                ensure  => file,
                content => template('prep6_mod/prep6.erb'),
    }

}
