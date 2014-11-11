define p4h::prep6::typeone(
  $content = 'default content',
) {

  file { "/root/prep6-typeone-${name}":
    content => $content,
  }

}
