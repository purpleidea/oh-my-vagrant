define p4h::cat_two_vars_to_file($var1, $var2, $resultFile = $name) { 
    p4h::create_file { "${resultFile}":
       contents => "${var1}${var2}",
    }
}