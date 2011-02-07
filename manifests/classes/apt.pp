# Helper class to update the local APT cache with "apt-get update".  The
# fact that apt-get(8) is used instead of, for example, aptitude(8) should
# not concern the user of this class.
#
# Usage:
#  include debian::apt::update
#  exec { '...':
#    notify => $debian::apt::update::exec
#  }
class debian::apt::update
{
  exec { '/usr/bin/apt-get update':
    logoutput => on_failure,
    refreshonly => true
  }

  $exec = Exec['/usr/bin/apt-get update']
}
