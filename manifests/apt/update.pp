# Helper class to update the local APT cache with "apt-get update".  The
# fact that apt-get(8) is used instead of, for example, aptitude(8) should
# not concern the user of this class.
#
# == Example
#
#  include debian::apt::update
#
#  exec { '...':
#    notify => $debian::apt::update::exec,
#    Class['debian::apt::update']
#  }
class debian::apt::update
{
	include debian::apt

	$command = "$debian::apt::apt_get update"

	exec { $command:
		refreshonly => true,
		require => Class['debian::apt']
	}

	$exec = Exec[$command]
}
