class p4h::prep5class1($msg1="This is default message1", $msg2="This is default message2") {
    include prep5class2
    include prep5class2

    file { '/root/prep5class1.txt':
        ensure  => present,
        content => "${msg1} ${msg2}",
    }
}