
class p4h::exampleblip ($metathing = "blip", $blargh = "zap") {

    file { '/root/exampleblip.txt':
            content => "some $metathing content. $blargh"
    }

    include p4h::examplefoobar
}
