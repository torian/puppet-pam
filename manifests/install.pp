
class pam::install {
	
	package { $pam::params::package:
		ensure => present,
	}
	
}
