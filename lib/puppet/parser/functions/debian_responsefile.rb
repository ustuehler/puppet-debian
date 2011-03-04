module Puppet::Parser::Functions
	newfunction(:debian_responsefile, :type => :rvalue) do |args|
		"/var/lib/dpkg/preseeds/#{args[0]}"
	end
end
