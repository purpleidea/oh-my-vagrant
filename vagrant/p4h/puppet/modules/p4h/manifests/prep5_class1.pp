class p4h::prep5_class1() {
  file { '/root/foo_class1':
    ensure => file,
    content => "the following statment is false.
the previous statment is true."
  }

  include p4h::prep5_class2
}
