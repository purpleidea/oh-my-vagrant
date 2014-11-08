define p4h::create_file($contents, $file=$name) { 
    file { "${file}":
        content => "$contents",
    }
}