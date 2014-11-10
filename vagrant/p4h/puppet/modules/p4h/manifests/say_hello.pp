
define p4h::say_hello($hiname = "world", $filepath = "/hello") {
	notify{"hello ${hiname}":}

	file{"${filepath}":
		content => "hello ${hiname}"
	}
}
