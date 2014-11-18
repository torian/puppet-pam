# == Class: pam::pamd::redhat
#
class pam::pamd::redhat {

  include pam::params

  File {
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644'
  }

  file { "${pam::params::prefix_pamd}/system-auth-ac":
    content => template('pam/pam.d/system-auth-ac.erb')
  }

  file { "${pam::params::prefix_pamd}/system-auth":
    ensure => 'link',
    target => '/etc/pam.d/system-auth-ac'
  }

  file { "${pam::params::prefix_pamd}/smartcard-auth-ac":
    content => template('pam/pam.d/smartcard-auth-ac.erb')
  }

  file { "${pam::params::prefix_pamd}/smartcard-auth":
    ensure => 'link',
    target => '/etc/pam.d/smartcard-auth-ac'
  }

  if($pam::pamd::pam_ldap) {

    #File['/etc/ldap.conf'] -> File[$pam::params::ldap_conf]

    file { '/etc/ldap.conf':
      ensure  => link,
      target  => $pam::params::ldap_conf,
    }

  }

  case $::operatingsystemmajrelease {

    5 : {}

    6 : {

      file { "${pam::params::prefix_pamd}/password-auth-ac":
        ensure  => present,
        content => template('pam/pam.d/system-auth-ac.erb'),
      }

      # rhel 6 uses pam_ldap.conf:
      if($pam::pamd::pam_ldap) {

        #File['/etc/pam_ldap.conf'] -> File[$pam::params::ldap_conf]

        file { '/etc/pam_ldap.conf':
          ensure  => link,
          target  => $pam::params::ldap_conf,
        }

      }

    }

    default : {
      notice("Version $::operatingsystemmajrelease not handled")
    }

  }

}
