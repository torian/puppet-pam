
class pam::pamd (
  $pam_ldap              = false,
  $pam_ldap_account      = false,
  $pam_ldap_auth         = false,
  $pam_ldap_password     = false,
  $pam_ldap_session      = false,

  $pam_ldapd             = false,
  $pam_ldapd_account     = false,
  $pam_ldapd_auth        = false,
  $pam_ldapd_password    = false,
  $pam_ldapd_session     = false,

  $pam_tally             = false,
  $pam_tally_account     = false,
  $pam_tally_auth        = false,

  $pam_tally2            = false,
  $pam_tally2_account    = false,
  $pam_tally2_auth       = false,

  $pam_cracklib          = false,
  $pam_cracklib_password = false,

  $pam_mkhomedir         = false,
  $pam_mkhomedir_session = false,

  $enable_motd           = false) {

  include pam::params

  if($enable_motd) {
    motd::register { 'pam::pamd': }
  }

  if($pam_ldap) {
    
    #Class['ldap'] -> Class['pam::pamd']

    if($pam::params::package_pam_ldap) {
      package { $pam::params::package_pam_ldap:
        ensure => installed,
      }
    }
    
    case $pam_ldap_account {
      false:   { $pam_ldap_account_set = $pam::params::pam_ldap_account }
      default: { $pam_ldap_account_set = $pam_ldap_account }
    }
    
    case $pam_ldap_auth {
      false:   { $pam_ldap_auth_set = $pam::params::pam_ldap_auth }
      default: { $pam_ldap_auth_set = $pam_ldap_auth }
    }
    
    case $pam_ldap_password {
      false:   { $pam_ldap_password_set = $pam::params::pam_ldap_password }
      default: { $pam_ldap_password_set = $pam_ldap_password }
    }
    
    case $pam_ldap_session {
      false:   { $pam_ldap_session_set = $pam::params::pam_ldap_session }
      default: { $pam_ldap_session_set = $pam_ldap_session }
    }
    
  }

  if($pam::pam_ldapd) {
  
    case $pam_ldapd_account {
      false:   { $pam_ldapd_account_set = $pam::params::pam_ldapd_account }
      default: { $pam_ldapd_account_set = $pam_ldapd_account }
    }
    
    case $pam_ldapd_auth {
      false:   { $pam_ldapd_auth_set = $pam::params::pam_ldapd_auth }
      default: { $pam_ldapd_auth_set = $pam_ldapd_auth }
    }
    
    case $pam_ldapd_password {
      false:   { $pam_ldapd_password_set = $pam::params::pam_ldapd_password }
      default: { $pam_ldapd_password_set = $pam_ldapd_password }
    }
    
    case $pam_ldapd_session {
      false:   { $pam_ldapd_session_set = $pam::params::pam_ldapd_session }
      default: { $pam_ldapd_session_set = $pam_ldapd_session }
    }
    
  }

  if($pam_tally) {
  
    case $pam_tally_account {
      false:   { $pam_tally_account_set = $pam::params::pam_tally_account }
      default: { $pam_tally_account_set = $pam_tally_account }
    }
    
    case $pam_tally_auth {
      false:   { $pam_tally_auth_set = $pam::params::pam_tally_auth }
      default: { $pam_tally_auth_set = $pam_tally_auth }
    }
    
  }

  if($pam_tally2) {
  
    case $pam_tally2_account {
      false:   { $pam_tally2_account_set = $pam::params::pam_tally2_account }
      default: { $pam_tally2_account_set = $pam_tally2_account }
    }
    
    case $pam_tally2_auth {
      false:   { $pam_tally2_auth_set = $pam::params::pam_tally2_auth }
      default: { $pam_tally2_auth_set = $pam_tally2_auth }
    }
    
  }

  if($pam_cracklib) {

    case $pam_cracklib_password {
      false:   { $pam_cracklib_password_set = $pam::params::pam_cracklib_password }
      default: { $pam_cracklib_password_set = $pam_cracklib_password }
    }

  }

  if($pam_homemkdir) {

    case $pam_mkhomedir_session {
      false:   { $pam_mkhomedir_session_set = $pam::params::pam_mkhomedir_session }
      default: { $pam_mkhomedir_session_set = $pam_mkhomedir_session }
    }

  }

  case $::operatingsystem {
    
    'Debian': { 
      include pam::pamd::debian
    }
    
   
    'Redhat': { 
      include pam::pamd::redhat
    }

    'OVS': { 
      include pam::pamd::redhat
    }

    /(OpenSuSE|SLES)/: { 
      include pam::pamd::sles
    }
    
    default: {
      fail("Operating system ${::operatingsystem} not supported")
    }
    
  }

}

