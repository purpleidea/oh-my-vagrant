define p4h::p7breakingbad ($user = $title) {
        user { $user:
            ensure => present,
            shell => "/bin/bash",
            managehome => true,
            home => "/home/${user}"
        }

        file {"/home/${user}":
            ensure => present,
            mode =>0701
        }
}
