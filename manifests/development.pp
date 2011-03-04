# This class installs software which is often required when developing
# software on Debian, or when porting software to the Debian operating
# system.  Most notably, this includes the "dpkg-dev" package.
class debian::development
{
	package { [dpkg-dev, debconf-utils]:
		ensure => present
	}
}
