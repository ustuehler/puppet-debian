# Manage sources.list(5) fragments.
define debian::apt::source($uri, $distribution, $components = [])
{
	include debian::apt::update

	$sources_list_dir = $debian::apt::sources_list_dir

	file { "$sources_list_dir/$name.list":
		content => template("debian/apt/source.list"),
		mode => 444,
		notify => $debian::apt::update::exec
	}

	# XXX: This trick wants to make sure that "apt-get update" has
	# run successfully if another resource depends this APT source.
	class noop {}
	class { noop: require => $debian::apt::update::exec }
}
