
class prep6() {
  $message = "You are currently running on ${hostname}"
  notify { 'welcomehost':
		message => "${message}",
	}
}