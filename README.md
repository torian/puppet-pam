Puppet PAM Module
=================

Introduction
------------

Puppet module to manage **PAM** configuration.

Usage
-----

# Class pam::pamd

## No module configuration

  class { 'pam::pamd': }

## Ldap module

If you want pam_ldap:

  class { 'pam::pamd':
    pam_ldap  => true,
    ldap_uri  => 'ldap:://ldap.example.com',
    ldap_base => 'dc=example,dc=base', 
  }

Or even if you need a specific behavoir on auth:

  class { 'pam::pamd':
    pam_ldap      => true,
    pam_ldap_auth => '[success=1 default=ignore] pam_ldap.so use_first_pass'
    ldap_uri      => 'ldap:://ldap.example.com',
    ldap_base     => 'dc=example,dc=base', 
  }

Note: otherwise, pam_ldap_auth defaults to 'sufficient pam_ldap.so use_first_pass'

Notes
-----

Tested on
 * Debian: 5.0 (etch) / 6.0 (squeeze) / 7.0 (wheezy)

Requirements
------------

  None

TODO
----

 * Testing was done only on pam_ldap parameters
 * Test on rhel

CopyLeft
---------

Copyleft (C) 2012 Emiliano Castagnari <ecastag@gmail.com> (a.k.a. Torian)

