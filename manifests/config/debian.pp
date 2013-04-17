
class pam::config::debian {
	
	include pam::params
	
	File {
		ensure  => present,
		owner   => 'root',
		group   => 'root',
		mode    => 0644,
		require => Package[$pam::params::package],
	}
	
	file { '/etc/pam_ldap.conf':
		ensure => link,
		target => '/etc/ldap/ldap.conf';
	}
	
	file { '/etc/pam.d/common-account':
		content => template("pam/pam.d/debian/common-account.erb"),
		require => File['/etc/pam_ldap.conf'],
	}
	
	file { '/etc/pam.d/common-auth':
		content => template("pam/pam.d/debian/common-auth.erb"),
		require => File['/etc/pam_ldap.conf'],
	}
	
	file { '/etc/pam.d/common-password':
		content => template("pam/pam.d/debian/common-password.erb"),
		require => File['/etc/pam_ldap.conf'],
	}
	
	file { '/etc/pam.d/common-session-noninteractive':
		content => template("pam/pam.d/debian/common-session-noninteractive.erb"),
		require => File['/etc/pam_ldap.conf'],
	}
	
	file { '/etc/pam.d/common-session':
		content => template("pam/pam.d/debian/common-session.erb"),
		require => File['/etc/pam_ldap.conf'],
	}
	
}

