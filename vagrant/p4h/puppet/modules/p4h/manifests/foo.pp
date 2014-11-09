class p4h::foo($sport='hockey', $team='N.J. Devils') {
    include bar
    include bar

    file { '/tmp/scoreboard.txt':
        ensure => present,
        content => "My favorite ${sport} team is the ${team}!"
    }
}
