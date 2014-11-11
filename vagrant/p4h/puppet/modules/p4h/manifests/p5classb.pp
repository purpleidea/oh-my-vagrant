
class p4h::p5classb($path = "/tmp/testfile", $content = "file content goes here") {
    file { "testfile":
        path    => $path,
        content => $content,
        ensure  => file
    }
}
