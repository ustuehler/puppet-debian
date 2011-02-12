# Manage PGP keys for APT repositories.  This resource type will download
# a PGP key from $source and add it to the trusted key ring, unless a key
# that matches $name is already present.
#
# == Parameters
#
# - name: The name of the key.  It must be some string that will appear
#   in the output of "apt-key list" when the key is installed.
#
# - source: The URL of the PGP key to download and install.  The URL must
#   be understood by wget(1).
#
# == Requires
#
# - Class[wget] and $wget::binary.
#
define debian::apt::key($source)
{
	include debian::apt
	include wget

	if ! $wget::binary {
		fail("\$wget::binary is empty or unset")
	}

	$apt_key = $debian::apt::apt_key

	exec { "$wget::binary -q -O - '$source' | $apt_key add -":
		unless => "$apt_key list | grep -q '$name'",
		require => Class['debian::apt', wget]
	}
}
