#encoding: utf-8

require "ffi"

module Rubylike
	# The color saved as red, green, blue
	# @example Get the red-value of a color
	#   Rubylike::Colors::red.red #=> 255
	# @!attribute [r] red
	#   @return [Integer] The red value, allowed values: 0…255
	# @!attribute [r] green
	#   @return [Integer] The green value, allowed values: 0…255
	# @!attribute [r] blue
	#   @return [Integer] The blue value, allowed values: 0…255
	# @since 0.0.1
	# @author Norbert Melzer <mailto:timmelzer@gmail.com>
	class Color < FFI::Struct
		layout	:r, :uint8,
				:g, :uint8,
				:b, :uint8

		def red
			self[:r]
		end

		def green
			self[:g]
		end

		def blue
			self[:b]
		end

		# Add a color
		# @see Rubylike::Colors#add
		# @example
		#   c = Rubylike::Colors::red + Rubylike::Colors::blue
		#   puts "#{c[:r]}, #{c[:g]}, #{c[:b]}" #=> 255, 0, 255
		# @param [Color] color The color that should be added
		# @return [Color] The resulting color
		# @author Norbert Melzer <mailto:timmelzer@gmail.com>
		def +(color)
			Colors::add(self, color)
		end

		# Subtract a color
		# @param [Color] color The color that should be subtracted
		# @return [Color] The resulting color
		# @author Norbert Melzer <mailto:timmelzer@gmail.com>
		def -(color)
			Colors::subtract(self, color)
		end

		# Multiply a color
		# @param [Color] color The color that should be multiplied
		# @return [Color] The resulting color
		# @author Norbert Melzer <mailto:timmelzer@gmail.com>
		def *(color)
			Colors::multiply(self, color)
		end

		# Scalar-multiply a color
		# @param [Color] color The color that should be scalar-multiplied
		# @return [Color] The resulting color
		# @author Norbert Melzer <mailto:timmelzer@gmail.com>
		def **(color)
			Colors::multiply_scalar(self, color)
		end
	end

	# @since 0.0.1
	# @author Norbert Melzer <mailto:timmelzer@gmail.com>
	module Colors
		extend FFI::Library
		extend Rubylike::Loader

		def make_color(r, g, b)
			c = Color.new
			c[:r] = r
			c[:g] = g
			c[:b] = b
			c
		end

		colorNames = %w(red flame orange amber yellow lime chartreuse green sea turquoise cyan sky azure blue han violet purple fuchsia magenta pink crimson)
		saturationNames = %w(desaturated lightest lighter light dark darker darkest)

		colorNames.each do |c|
			attach_variable "#{c}", "TCOD_#{c}", Color
			saturationNames.each do |s|
				attach_variable "#{s}#{c.capitalize}", "TCOD_#{s}_#{c}", Color
			end
		end

		colorNames = %w(grey sepia)
		saturationNames = %w(lightest lighter light dark darker darkest)

		colorNames.each do |c|
			attach_variable "#{c}", "TCOD_#{c}", Color
			saturationNames.each do |s|
				attach_variable "#{s}#{c.capitalize}", "TCOD_#{s}_#{c}", Color
			end
		end

		colorNames = %w(brass copper gold silver celadon peach)

		colorNames.each do |c|
			attach_variable "#{c}", "TCOD_#{c}", Color
		end


		# Compare 2 colors
		# @param [Color] color1 One of the both colors which will be compared
		# @param [Color] color2 The other color which will be compared to the other one
		# @return [Boolean] Wether the colors are equal or not
		# @author Norbert Melzer <mailto:timmelzer@gmail.com>
		attach_function :equal,				:TCOD_color_equals,				[ Color.by_value, Color.by_value ], :bool
		
		# Add 2 colors
		# @param [Color] color1 The color to which the other one is added
		# @param [Color] color2 The color which is added to the first
		# @return [Color] The resulting color
		# @author Norbert Melzer <mailto:timmelzer@gmail.com>
		attach_function :add,				:TCOD_color_add,				[ Color.by_value, Color.by_value ], Color.by_value
		
		# Subtract 2 colors
		# @param [Color] color1 The color from which the other one is substracted
		# @param [Color] color2 The color which is substracted from the first
		# @return [Color] The resulting color
		# @author Norbert Melzer <mailto:timmelzer@gmail.com>
		attach_function :subtract,			:TCOD_color_subtract,			[ Color.by_value, Color.by_value ], Color.by_value
		
		# Multiply 2 colors
		# @param [Color] color1 The color which is multiplied by the other
		# @param [Color] color2 The color which is multiplied with the first
		# @return [Color] The resulting color
		# @author Norbert Melzer <mailto:timmelzer@gmail.com>
		attach_function :multiply,			:TCOD_color_multiply,			[ Color.by_value, Color.by_value ], Color.by_value
		
		# Multiply 2 colors
		# @param [Color] color1 The color which is multiplied by the other
		# @param [Color] color2 The color which is multiplied with the first
		# @return [Color] The resulting color
		# @author Norbert Melzer <mailto:timmelzer@gmail.com>
		attach_function :multiply_scalar,	:TCOD_color_multiply_scalar,	[ Color.by_value, Color.by_value ], Color.by_value
		attach_function :lerp,				:TCOD_color_lerp,				[ Color.by_value, Color.by_value ], Color.by_value
	end
end