require "rubylike/version"
require "ffi"

# @since 0.0.1
# @author Norbert Melzer <mailto:timmelzer@gmail.com>
module Rubylike
	extend FFI::Library

	module Loader
		extend FFI::Library
		def self.extended(base)
			base.ffi_lib ['lib/ext/libSDL.so']
			base.ffi_lib ['lib/ext/libtcod.so']
		end
	end

	require "rubylike/color"
	require "rubylike/console"
end
