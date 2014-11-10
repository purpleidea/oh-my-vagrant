class p4h::prep5_gen_file($file_location="/var/log/prep5.txt", $a="foo", $b="bar") {

    file { $file_location:
        content => "Content for prep5:
                    a=${a}, b=${b}
                    ",
    }
}

# vim: ts=8
