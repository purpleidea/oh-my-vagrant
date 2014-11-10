class bensmodule {
  
  $timestamp = chomp(generate('/bin/date', '+%s'))
  
  file {'/root/.ssh/config':
    content => template('bensmodule/benstemplate.erb')
  }
}