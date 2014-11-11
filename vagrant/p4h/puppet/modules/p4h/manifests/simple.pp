class p4h::simple() {
    include less_but_still_simple

    file { '/home/vagrant/some_file.txt':
        ensure => file,
        content => "some_text\n",
    }
}


include less_but_still_simple
