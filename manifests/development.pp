# This class installs software which is often required when developing
# software on Debian, or when porting software to the Debian operating
# system.  Most notably, this includes the "dpkg-dev" package.
class debian::development
{
  package { [dpkg-dev, debconf-utils]:
    ensure => present
  }

  # equivs is a "tool to circumvent Debian package dependencies" or
  # to build small packages containing normal files.
  package { equivs:
    ensure => present
  }
}
