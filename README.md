Puppet PAM Module
=================

Introduction
------------

Puppet module to manage **PAM** configuration.

Usage
-----

### Class pam::pamd

#### No module configuration

```
  class { 'pam::pamd': }
```

#### Ldap module

If you want pam_ldap:

```
  class { 'pam::pamd':
    pam_ldap  => true,
  }
```
Or even if you need a specific behavoir on auth:

```
  class { 'pam::pamd':
    pam_ldap      => true,
    pam_ldap_auth => '[success=1 default=ignore] pam_ldap.so use_first_pass'
  }
```

Note: otherwise, pam_ldap_auth defaults to 'sufficient pam_ldap.so use_first_pass'

Notes
-----

Tested on
 * Debian: 5.0 (etch) / 6.0 (squeeze) / 7.0 (wheezy)
 * Redhat: 5.x 

Requirements
------------

 * If pam_ldap is enabled (pam_ldap => true) you'll need
   [puppet-ldap](https://github.com/torian/puppet-ldap.git)
 * If enable_motd is enabled (enable_motd => true) you'll need
   [puppet-motd](https://github.com/torian/puppet-motd.git)

TODO
----

 * Testing was done only on pam_ldap parameters
 * Test on rhel

CopyLeft
---------

Copyleft (C) 2012 Emiliano Castagnari <ecastag@gmail.com> (a.k.a. Torian)

