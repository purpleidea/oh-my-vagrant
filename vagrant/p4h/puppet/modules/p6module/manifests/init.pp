


class p6module() {

    $hour = template("p6module/hour.erb")

    if $hour =~ /\d+/ {
        if $hour < 12 {
            $msg = "Good morning"
        } elsif $hour < 16 {
            $msg = "Good afternoon"
        } else {
            $msg = "Good evening"
        }
    } else {
        $msg = "derp"
    }

    notify { "greeting":
        name    => "greeting",
        message => $msg
    }

}