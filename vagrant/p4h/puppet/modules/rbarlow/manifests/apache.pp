
class rbarlow::apache() {
    package { 'httpd':
        ensure => present,
    }

    service { 'httpd':
        ensure => running,
        require => Package['httpd'],
    }

    file { '/var/www/html/index.html':
        ensure => file,
        content => template('rbarlow/index.erb'),
        require => Package['httpd'],
        before => Service['httpd'],
    }
}
