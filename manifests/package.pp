
class pam::package {
	
	include pam::params
	
	package { $pam::params::package:
		ensure => $ensure,
	}
	
}
