
class pam::config::debian {

	#augeas { "${pam::params::prefix}/":
	#	context => "/files/${pam::params::prefix} ... ",
	#	changes => $databases,
	#}

	File {
		ensure  => present,
		owner   => root,
		group   => root,
		mode    => 0644,
		require => Package[$pam::params::package],
	}

	file { '/etc/pam_ldap.conf':
		ensure  => link,
		target  => '/etc/ldap/ldap.conf',
	}

	file { '/etc/pam.d/common-account':
		source  => "puppet:///${pam::params::mod_prefix}/etc/pam.d/common-account",
	}

	file { '/etc/pam.d/common-auth':
		source  => "puppet:///${pam::params::mod_prefix}/etc/pam.d/common-auth",
	}

	file { '/etc/pam.d/common-password':
		source  => "puppet:///${pam::params::mod_prefix}/etc/pam.d/common-password",
	}

	file { '/etc/pam.d/common-session':
		source  => "puppet:///${pam::params::mod_prefix}/etc/pam.d/common-session",
	}

	file { '/etc/pam.d/common-session-noninteractive':
		source  => "puppet:///${pam::params::mod_prefix}/etc/pam.d/common-session-noninteractive",
	}

}

