define debian::apt::preferences($ensure = present, $content = undef)
{
	file { "/etc/apt/preferences.d/$name":
		ensure => $ensure,
		owner => root,
		group => root,
		mode => 444,
		content => $content
	}
}
