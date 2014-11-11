define p4h::prep6::typetwo(
  $content = 'type two in da house!',
){

  file { "/root/prep6-typetwo-${name}":
    ensure  => file,
    content => $content,
  }

}
