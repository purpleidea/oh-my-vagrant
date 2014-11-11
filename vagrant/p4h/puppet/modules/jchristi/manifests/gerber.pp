class jchristi::gerber {

  $templ = template('jchristi/gerber.erb')

  if $templ != 'dont match me' {
    notify { $templ: }
  }

}
