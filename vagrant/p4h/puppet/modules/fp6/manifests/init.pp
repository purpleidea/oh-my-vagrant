class fp6() {
    $whichHost      = 'prep6'
    $templateResult = template('fp6/hostTest.erb')

    if $templateResult == 'yessir' {
        notify { 'EmittingTheMessageT':
            message => "I used the correct host",
        }
    } else {
        notify { 'EmittingTheMessageF':
            message => "Dunno what I am doing",
        }
    }
}