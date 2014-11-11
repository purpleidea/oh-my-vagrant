
define p4h::p7type1 ($path = "/tmp/typeout", $content = "file content") {

    file { "typeout_${name}":
        path    => $path,
        content => $content,
        ensure  => file
    }

    notify { "file_notice_${name}":
        message => "Type output file created",
        require => File["typeout_${name}"]
    }

}
