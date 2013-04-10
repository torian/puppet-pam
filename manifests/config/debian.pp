
class pam::config::debian {
  include pam::params

  File {
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    require => Package[$pam::params::package],
  }

  file {
    '/etc/pam_ldap.conf':
      ensure => link,
      target => '/etc/ldap/ldap.conf';

    '/etc/pam.d/common-account':
      source => "puppet:///modules/pam/debian/etc/pam.d/common-account";

    '/etc/pam.d/common-auth':
      source => "puppet:///modules/pam/debian/etc/pam.d/common-auth";

    '/etc/pam.d/common-password':
      source => "puppet:///modules/pam/debian/etc/pam.d/common-password";

    '/etc/pam.d/common-session':
      source => "puppet:///modules/pam/debian/etc/pam.d/common-session";

    '/etc/pam.d/common-session-noninteractive':
      source => "puppet:///modules/pam/debian/etc/pam.d/common-session-noninteractive";
  }

}

