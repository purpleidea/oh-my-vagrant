
include p4h::prep5_beta

class p4h::prep5_alpha(
    $user_name    = 'Bob',
    $location = 'Raleigh') {

	file { '/root/alpha':
		content => "Hello ${user_name} from ${location}"
  }

}
