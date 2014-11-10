class p4h::prep5_class2 ( $var1 = "default_value", $var2 = true ) {
  file { '/root/foo_class2':
    ensure => file,
    content => "default value: ${var1}
var2: ${var2}"
  }
}
