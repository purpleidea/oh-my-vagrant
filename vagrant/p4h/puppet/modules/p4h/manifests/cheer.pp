define p4h::cheer($loudness, $team = 'N. J. Devils') {
    notify { $loudness: message => "Here we go ${team}!"}
}
