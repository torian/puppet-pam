
# Tested against:
#   - Debian ?
#   - RHEL   5.2   / 5.4   / 5.5   / 6.1   / 6.2 /
#   - OVS    2.1.1 / 2.1.5 / 2.2.0 / 3.0.2 /

class pam($module_type = 'none') {

	include pam::params
	include pam::install
	include pam::config
	
}
