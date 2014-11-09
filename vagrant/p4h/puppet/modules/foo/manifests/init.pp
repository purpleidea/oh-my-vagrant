class foo() {
	if "${::hostname}" == "prep6" {
		include "::foo::apache"
	}
}