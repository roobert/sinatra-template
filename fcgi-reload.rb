#!/usr/bin/env ruby

#
# Misc.
#

fcgi_reload = true
begin
	loaded_paths = [__FILE__] + $".grep(/\.rb$/).map do |f| 
		if File.exists?(f)
			f
		else
			r =  $:.map { |d| File.join(d, f) }.find { |path| File.exists?(path) }
		raise("Can't find path for #{f}") unless r
			r
		end
	end

	MTIMES = loaded_paths.map { |f| File.mtime f }
	
	before do
		mtimes = loaded_paths.map { |f| File.mtime f }
		if MTIMES != mtimes
			puts "Reload required, exiting..."
			def (request.env['rack.input']).close
				exit 0
			end
		end
	end
end if fcgi_reload
