
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
		source  => "puppet:///modules/pam/debian/etc/pam.d/common-account",
		require => File['/etc/pam_ldap.conf'],
	}
	
	file { '/etc/pam.d/common-auth':
		source => "puppet:///modules/pam/debian/etc/pam.d/common-auth",
		require => File['/etc/pam_ldap.conf'],
	}
	
	file { '/etc/pam.d/common-password':
		source => "puppet:///modules/pam/debian/etc/pam.d/common-password",
		require => File['/etc/pam_ldap.conf'],
	}
	
	file { '/etc/pam.d/common-session-noninteractive':
		source => "puppet:///modules/pam/debian/etc/pam.d/common-session-noninteractive",
		require => File['/etc/pam_ldap.conf'],
	}
	
	file { '/etc/pam.d/common-session':
		content => template("pam.d/debian/common-session.erb"),
		require => File['/etc/pam_ldap.conf'],
	}
	
}

