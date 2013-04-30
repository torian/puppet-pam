
class pam::pamd::redhat {

  include pam::params

  File {
    owner  => 'root',
    group  => 'root',
    mode   => 0644,
    ensure => present
  }

  file { "${pam::params::prefix_pamd}/system-auth-ac":
    content => template('pam/pam.d/system-auth-ac.erb')
  }

  file { "${pam::params::prefix_pamd}/system-auth":
    content => template('pam/pam.d/system-auth-ac.erb')
  }

  case $::operatingsystemrelease {
    /^6\./: {
      file { "${pam::params::prefix_pamd}/password-auth-ac":
        ensure  => file,
        content => template('pam/pam.d/system-auth-ac.erb'),
      }
    }
  }

  if($pam::pamd::pam_ldap) {
    file { '/etc/ldap.conf':
      ensure  => link,
      target  => $pam::params::ldap_conf,
      require => [ Class['ldap'], File[$pam::params::ldap_conf] ],
    }
  }
}
