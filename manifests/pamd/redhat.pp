
class pam::pamd::redhat {

  include pam::params

  File {
    owner  => 'root',
    group  => 'root',
    mode   => 0644,
    ensure => present
  }

  file { "${pam::params::prefix_pamd}/system-auth":
    content => template('pam/pam.d/system-auth.erb')
  }

  file { "${pam::params::prefix_pamd}/system-auth-ac":
    ensure  => symlink,
    target  => "${pam::params::prefix_pamd}/system-auth-ac",
    require => File["${pam::params::prefix_pamd}/system-auth"],
  }

  if($pam::pamd::pam_ldap) {
    file { '/etc/ldap.conf':
      ensure  => symlink,
      target  => $pam::params::ldap_conf,
      require => [ Class['ldap'], File[$pam::params::ldap_conf] ],
    }
  }
}
