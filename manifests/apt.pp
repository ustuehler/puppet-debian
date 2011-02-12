# Ensure that Debian's Advanced Package Tool is installed.  Although
# it first appeared in Debian, this package tool is not constrained
# to Debian anymore.  For example, {Nexenta}[http://nexenta.org/] is
# using it on OpenSolaris/Illumos.
#
# == Class Variables
#
# - apt_get: The full path to the apt-get(8) utility.
# - apt_key: The full path to the apt-key(8) utility.
# - sources_list_dir: The full path to the sources.list(5) fragment
#   directory.  This is normally "/etc/apt/sources.list.d".
#
class debian::apt
{
	case $operatingsystem {
	    Debian: {
		# should always have apt(8)
		$apt_get = "/usr/bin/apt-get"
		$apt_key = "/usr/bin/apt-key"
		$sources_list_dir = "/etc/apt/sources.list.d"
	    }

	    default: {
		fail("$operatingsystem is currently unsupported")
	    }
	}
}
