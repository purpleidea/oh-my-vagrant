define dockerfile ($content) {
  file {"$title":
    path => "/root/docker/${title}",
    ensure => directory,
    owner => 'root',
    require => [ Package['docker'], File['/root/docker'] ],
  }

  file {"$title/Dockerfile":
    path => "/root/docker/${title}/Dockerfile",
    ensure => file,
    content => $content,
    owner => 'root',
    require => [ Package['docker'], File[$title] ],
  }
}