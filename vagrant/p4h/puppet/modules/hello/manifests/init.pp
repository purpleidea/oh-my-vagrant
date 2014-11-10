
class hello () {

	$template = template('hello/world.erb')

	if $template !~ /^hello/ {
		notify { 'error': message => "My mind is going dave..." }
	} else {
		file {"/hello":
			content => $template
		}
	}
}
