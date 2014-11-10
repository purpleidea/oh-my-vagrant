
# vim: ts=8
define p4h::create_user ($user=$title) {
  user { $user:
  ensure  => present,
  home => "/home/${user}",
  managehome => true,
  }

  file {"/home/${user}/foo.txt":
    ensure  => file,
    require => User[$user],
    content => "Sweet Dreams!!!",
    mode    => 0644,
    owner   => $user
  }
}
