class p4h::less_but_still_simple( $param_one = "param_one", $param_two = "param_two" ) {
    file { '/home/vagrant/less_but_still_simple.txt':
        ensure => file,
        content => "The first parameter: $param_one\nThe second parameter: $param_two\n",
    }
}
