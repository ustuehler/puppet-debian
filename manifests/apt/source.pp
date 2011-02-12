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

	# This resource does nothing but to ensure that any other resource
	# depending on this APT source will also depend on "apt-get update"
	# having completed successfully.
	debian::apt::source::sync { $name:
		require => $debian::apt::update::exec
	}
}

# This is just a dummy resource that is used with a require parameter to
# ensure that "apt-get update" has completed successfully.
define debian::apt::source::sync() {}
