
class bmboutermodule::init() {

  include bmboutermodule::anotherclass

  package { 'sl':
    ensure => "installed"
  }

  $my_template = template('bmboutermodule/bmbouter.erb')
  if $my_template == 'asdf' {
    $foo = 'template == asdf'
  } else
  {
    $foo = 'template != asdf'
  }

  class {'anotherclass':
    foo => $foo
  }

}
