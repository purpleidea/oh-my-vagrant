class p4h::simpleklass {
  include p4h::secondklass

  file { '/root/somefile':
    ensure  => file,
    content => $p4h::secondklass::msg,
  }

}
