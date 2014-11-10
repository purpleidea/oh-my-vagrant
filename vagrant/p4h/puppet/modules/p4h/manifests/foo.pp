class p4h::foo (
				$filename = 'foo',
				$verb = 'baking'
) {

	file {"/${filename}":
		content => "${verb} up"
	}
	include 'p4h::bar'
}
