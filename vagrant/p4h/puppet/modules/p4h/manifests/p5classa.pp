
class p4h::p5classa() {
    class { "::p4h::p5classb":
        content => "The contents of this file originate from p5classA.pp"
    }
}
