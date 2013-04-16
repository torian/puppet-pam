
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
      content => template("${b_url}/common-account.erb");

    '/etc/pam.d/common-auth':
      content => template("${b_url}/common-auth.erb");

    '/etc/pam.d/common-password':
      content => template("${b_url}/common-password.erb");

    '/etc/pam.d/common-session':
      content => template("${b_url}/common-session.erb");

    '/etc/pam.d/common-session-noninteractive':
      content => template("${b_url}/common-session-noninteractive.erb");
  }

}

