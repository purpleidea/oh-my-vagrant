define dockerbuild () {
  exec {"$title":
    command => "/usr/bin/docker build -t $title /root/docker/$title",
    cwd => "/root/docker/$title",
    user => 'root',
    require => Package['docker'],
  }
}