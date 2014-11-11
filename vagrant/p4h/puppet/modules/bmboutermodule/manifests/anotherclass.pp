class bmboutermodule::anotherclass($foo = "RRR") {

  file {'/root/anotherclass':
    content => $foo,
  }

}
