class justin() {

  $template = template('justin/lee.erb')
  if $template =~ /.*thisisastring.*/ {
     file { '/etc/lee.conf':
            content => $template
     }
  }
  else {
    notify { 'notlee': 
             message => "Not LEE!!"
    }
  }


}
