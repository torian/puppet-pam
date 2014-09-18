# == Class: pam::params
#
class pam::params {

  case $::osfamily {

    'Debian' : {
      $packages    = [ 'libpam-ldap' ]
      $prefix_pamd = '/etc/pam.d'
      $owner       = 'root'
      $group       = 'root'

      $package_pam_ldap      = 'libpam-ldap'
      $pam_ldap_account      = '[default=bad success=ok user_unknown=ignore] pam_ldap.so'
      $pam_ldap_auth         = 'sufficient    pam_ldap.so use_first_pass'
      $pam_ldap_password     = 'sufficient    pam_ldap.so use_authtok'
      $pam_ldap_session      = 'optional      pam_ldap.so'

      $pam_ldapd_account     = false
      $pam_ldapd_auth        = false
      $pam_ldapd_password    = false
      $pam_ldapd_session     = false

      $ldap_conf             = '/etc/ldap/ldap.conf'

      $pam_tally_account     = 'required      pam_tally.so'
      $pam_tally_auth        = 'required      pam_tally.so deny=3 onerr=fail'

      $pam_tally2_account    = 'required      pam_tally2.so'
      $pam_tally2_auth       = 'required      pam_tally2.so deny=3 onerr=fail unlock_time=60'

      $pam_cracklib_password = 'requisite     pam_cracklib.so try_first_pass retry=3 minlen=9 dcredit=-1'

      $pam_mkhomedir_session = 'requisite     pam_mkhomedir.so skel=/etc/skel/ umask=0022'

    }

    'Redhat' : {
      $packages    = [ 'pam' ]
      $prefix_pamd = '/etc/pam.d'
      $owner       = 'root'
      $group       = 'root'

      case $::operatingsystemmajrelease {
        5 : {
          $package_pam_ldap = 'nss_ldap'
          $pam_mkhomedir_so = 'pam_mkhomdir.so'
        }

        6 : {
          $package_pam_ldap = 'nss-pam-ldapd'
          $pam_mkhomedir_so = 'pam_oddjob_mkhomdir.so'
          $pam_mkhomedir_package = 'oddjob-mkhomedir'
        }
      
        default : {
          notice("${::operatingsystem} version ${::operatingsystemmajrelease} not handled")
        }
      }

      $pam_unix_account      = 'required      pam_unix.so broken_shadow'
      $pam_unix_auth         = 'sufficient    pam_unix.so nullok try_first_pass'
      $pam_unix_password     = 'sufficient    pam_unix.so md5 shadow nullok try_first_pass use_authtok'
      $pam_unix_session      = 'required      pam_unix.so'

      $pam_ldap_account      = '[default=bad success=ok user_unknown=ignore] pam_ldap.so'
      $pam_ldap_auth         = 'sufficient    pam_ldap.so use_first_pass'
      $pam_ldap_password     = 'sufficient    pam_ldap.so use_authtok'
      $pam_ldap_session      = 'optional      pam_ldap.so'

      $pam_ldapd_account     = false
      $pam_ldapd_auth        = false
      $pam_ldapd_password    = false
      $pam_ldapd_session     = false

      $pam_sss_account       = '[default=bad success=ok user_unknown=ignore] pam_sss.so'
      $pam_sss_auth          = 'sufficient    pam_sss.so use_first_pass'
      $pam_sss_password      = 'sufficient    pam_sss.so use_authtok'
      $pam_sss_session       = 'optional      pam_sss.so'

      $ldap_conf             = '/etc/openldap/ldap.conf'

      $pam_tally_account     = 'required      pam_tally.so'
      $pam_tally_auth        = 'required      pam_tally.so deny=3 onerr=fail'

      $pam_tally2_account    = 'required      pam_tally2.so'
      $pam_tally2_auth       = 'required      pam_tally2.so deny=3 onerr=fail unlock_time=60'

      $pam_cracklib_password = 'requisite     pam_cracklib.so try_first_pass retry=3 minlen=9 dcredit=-1'

      $pam_mkhomedir_session = "requisite     ${pam_mkhomedir_so} skel=/etc/skel/ umask=0022"

    }

    'Suse' : {
      $packages    = [ 'pam' ]
      $prefix_pamd = '/etc/pam.d'
      $owner       = 'root'
      $group       = 'root'

      $package_pam_ldap      = 'pam_ldap'
      $pam_ldap_account      = '[default=bad success=ok user_unknown=ignore] pam_ldap.so'
      $pam_ldap_auth         = 'sufficient    pam_ldap.so use_first_pass'
      $pam_ldap_password     = 'sufficient    pam_ldap.so use_authtok'
      $pam_ldap_session      = 'optional      pam_ldap.so'

      $pam_ldapd_account     = false
      $pam_ldapd_auth        = false
      $pam_ldapd_password    = false
      $pam_ldapd_session     = false

      $ldap_conf             = '/etc/openldap/ldap.conf'

      $pam_tally_account     = 'required      pam_tally.so'
      $pam_tally_auth        = 'required      pam_tally.so deny=3 onerr=fail'

      $pam_tally2_account    = 'required      pam_tally2.so'
      $pam_tally2_auth       = 'required      pam_tally2.so deny=3 onerr=fail unlock_time=60'

      $pam_cracklib_password = 'requisite     pam_cracklib.so try_first_pass retry=3 minlen=9 dcredit=-1'

      $pam_mkhomedir_session = 'requisite     pam_mkhomedir.so skel=/etc/skel/ umask=0022'

    }

    default: {
      fail("Operating system ${::operatingsystem} (${::osfamily}) not supported")
    }

  }

}
