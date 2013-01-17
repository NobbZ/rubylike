require "rubylike/version"
require "ffi"

module Rubylike
	extend FFI::Library

	module Loader
		extend FFI::Library
		def self.extended(base)
			base.ffi_lib ['ext/libSDL']
			base.ffi_lib ['ext/libtcod']
		end
	end

	module Color < FFI::Struct
		layout	:r, :uint8,
				:g, :uint8,
				:b, :uint8
	end

	module Colors
		extend FFI::Library
		extend Loader

		def make_color(r, g, b)
			c = Color.new
			c[:r] = r
			c[:g] = g
			c[:b] = b
			c
		end

		# functions
		attach_function :equal,				:TCOD_color_equals,				[ Color.by_value, Color.by_value ], :bool
		attach_function :add,				:TCOD_color_add,				[ Color.by_value, Color.by_value ], Color.by_value
		attach_function :subtract,			:TCOD_color_subtract,			[ Color.by_value, Color.by_value ], Color.by_value
		attach_function :multiply,			:TCOD_color_multiply,			[ Color.by_value, Color.by_value ], Color.by_value
		attach_function :multiply_scalar,	:TCOD_color_multiply_scalar,	[ Color.by_value, Color.by_value ], Color.by_value
		attach_function :lerp,				:TCOD_color_lerp,				[ Color.by_value, Color.by_value ], Color.by_value

		# grey levels
		attach_variable :black,	:TCOD_black,	:pointer
end
