class debian::responsefile::preseeds
{
	file { "/var/lib/dpkg/preseeds":
		ensure => directory,
		owner => root,
		group => root,
		mode => 550
	}
}
