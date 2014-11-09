
class rbarlow() {
    if "${::hostname}" == "prep6" {
        include apache
    } else {
        package {'httpd':
            ensure => absent,
        }

        service {'httpd':
            ensure => stopped,
        }

        notify { 'httpd is not present.':}
    }
}
