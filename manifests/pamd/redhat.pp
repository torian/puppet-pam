
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
    ensure  => symlink,
    target  => "${pam::params::prefix_pamd}/system-auth",
    require => File["${pam::params::prefix_pamd}/system-auth-ac"],
  }

  if($pam::pamd::pam_ldap) {
    file { '/etc/ldap.conf':
      ensure  => symlink,
      target  => $pam::params::ldap_conf,
      require => [ Class['ldap'], File[$pam::params::ldap_conf] ],
    }
  }
}
