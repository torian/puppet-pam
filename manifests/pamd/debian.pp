
class pam::pamd::debian {

  include pam::params

  File {
    owner  => 'root',
    group  => 'root',
    mode   => 0644,
    ensure => present
  }

  file { "${pam::params::prefix_pamd}/common-account":
    content => template('pam/pam.d/common-account.erb')
  }

  file { "${pam::params::prefix_pamd}/common-auth":
    content => template('pam/pam.d/common-auth.erb')
  }

  file { "${pam::params::prefix_pamd}/common-password":
    content => template('pam/pam.d/common-password.erb')
  }

  file { "${pam::params::prefix_pamd}/common-session":
    content => template('pam/pam.d/common-session.erb')
  }

  file { "${pam::params::prefix_pamd}/common-session-noninteractive":
    content => template('pam/pam.d/common-session-noninteractive.erb')
  }

  if($pam::pamd::pam_ldap) {
    file { '/etc/pam_ldap.conf':
      content => template('pam/pam_ldap.conf.erb'),
    }
  }
}

