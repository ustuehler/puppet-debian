define debian::apt::pin($ensure = present, $package, $pin, $pin_priority)
{
	debian::apt::preferences { "pin_$name":
		ensure => $ensure,
		content => "Package: $package\nPin: $pin\nPin-Priority: $pin_priority\n"
	}
}
