define p4h::want($trophy = 'Stanley Cup') {
    p4h::cheer{ 'scream': loudness => 'louder', team => 'DEVILS!!!!' }

    notify { 'trophy': message => "WE WANT THE ${trophy}!"}
}
