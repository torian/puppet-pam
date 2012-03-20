
class pam::config::redhat {

	File {
		ensure  => present,
		owner   => $pam::params::owner,
		group   => $pam::params::group,
		mode    => 0644,
		require => Package[$pam::params::package],
	}

	file { '/etc/pam_ldap.conf':
		ensure   => $module_type ? {
				'ldap'  => symlink,
				default => absent,
				},
		target   => $ldap::params::config,
		require  => File[$ldap::params::config],
	} 

	file { '/etc/pam.d/system-auth':
		content => template("${pam::params::mod_prefix}/${pam::params::system_auth}.erb")
	}

	if($operatingsystemrelease =~ /^6\./)
	{
		file { '/etc/pam.d/password-auth':
			content => template("${pam::params::mod_prefix}/${pam::params::password_auth}.erb")
		}
	}
}

