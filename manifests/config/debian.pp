
class pam::config::debian {
  include pam::params

  File {
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    require => Package[$pam::params::package],
  }

  $b_url = 'pam/debian/etc/pam.d'

  file {
    '/etc/pam_ldap.conf':
      ensure => link,
      target => '/etc/ldap/ldap.conf';

    '/etc/pam.d/common-account':
      source => template("${b_url}/common-account.erb");

    '/etc/pam.d/common-auth':
      source => template("${b_url}/common-auth.erb");

    '/etc/pam.d/common-password':
      source => template("${b_url}/common-password.erb");

    '/etc/pam.d/common-session':
      source => template("${b_url}/common-session.erb");

    '/etc/pam.d/common-session-noninteractive':
      source => template("${b_url}/common-session-noninteractive.erb");
  }

}

