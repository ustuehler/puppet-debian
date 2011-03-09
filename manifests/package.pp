# Install a Debian package and (re)configure it using debconf-set-selections
# and dpkg-reconfigure, if necessary.
define debian::package($ensure = installed, $responses)
{
	debian::responsefile { $name:
		content => $responses,
		notify => Exec["dpkg-reconfigure $name"]
	}

	package { $name:
		ensure => $ensure,
		responsefile => $file,
		require => Debian::Responsefile[$name]
	}

	$file = debian_responsefile($name)
	$dss = "/usr/bin/debconf-set-selections"
	$dr = "/usr/sbin/dpkg-reconfigure"
	$cmd = "$dss $file && $dr -f noninteractive $name"

	exec { $cmd:
		alias => "dpkg-reconfigure $name",
		refreshonly => true,
		require => [
			Debian::Responsefile[$name],
			Package[$name]
		]
	}
}
