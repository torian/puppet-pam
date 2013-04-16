
class pam::params {
  $pam_mkhomedir = false

  case $::operatingsystem {
    debian  : {
      $mod_prefix = 'pam/debian'

      $package = ['libpam-ldap']

      $prefix = '/etc/pam.d'
      $owner = 'root'
      $group = 'root'
    }

    default : {
      $mod_prefix = 'pam/redhat'

      $package = ['pam']

      $prefix = '/etc/pam.d'
      $owner = 'root'
      $group = 'root'

      case $operatingsystemrelease {
        /^6\./  : {
          $system_auth = '/etc/pam.d/system-auth-6.x'
          $password_auth = '/etc/pam.d/password-auth-6.x'
        }

        default : {
          $system_auth = '/etc/pam.d/system-auth-5.x'
        }
      }
    }

  }
}
