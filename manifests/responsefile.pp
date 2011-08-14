# Create a local file that can be used as the +responsefile+ parameter
# to a package resource.  The file format is the same as the output of
# the debconf-get-selections(1) command from the debconf-utils package.
define debian::responsefile($content)
{
	include debian::responsefile::preseeds

	file { "/var/lib/dpkg/preseeds/$name":
		ensure => present,
		content => $content,
		owner => root,
		group => root,
		mode => 440
	}
}
