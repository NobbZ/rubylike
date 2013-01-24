#encoding: utf-8

module Rubylike

	# Enumeration for the type of the renderer
	enum :renderer, [
		:glsl,
		:opengl,
		:sdl
	]

	# @author Norbert Melzer <mailto:timmelzer@gmail.com>
	# @since 0.0.2
	class Console < FFI::Struct
		extend FFI::Library
		extend Rubylike::Loader
		
		# Creates a new Console
		# @param [Integer] width The widht in characters of the Console
		# @param [Integer] height The height in characters of the Console
		# @return [Console] The newly created Console
		# @author Norbert Melzer <mailto:timmelzer@gmail.com>
		attach_function :new,					:TCOD_console_new,					[:int, :int],									Console
		
		# Initializes the root-Console
		# @param [Integer] width The width of the root-Console.
		# @param [Integer] height The height of the root-Console.
		# @param [String] title The title of the game window
		# @param [Boolean] fullscreen When set to true, the game window will be in fullscreen, when set to false it will be in windowed mode.
		# @param [Renderer] renderer The renderer that will be used (0=GLSL, 1=OPENGL, 2=SDL)
		# @return [Void]
		# @author Norbert Melzer <mailto:timmelzer@gmail.com>
		attach_function :initRoot,				:TCOD_console_init_root,			[:int, :int, :string, :bool, :renderer],				:void
		
		#attach_function :is_window_closed,		:TCOD_console_is_window_closed,		[],												:bool
		#attach_function :clear,					:TCOD_console_clear,				[:pointer],										:void
		#attach_function :wait_for_keypress,		:TCOD_console_wait_for_keypress,	[:bool],										Key.by_value
		#attach_function :flush,					:TCOD_console_flush,				[],												:void
		#attach_function :set_background_color,	:TCOD_console_set_background_color,	[:int, :pointer],								:void
		#attach_function :set_foreground_color,	:TCOD_console_set_foreground_color,	[:int, :pointer],								:void
		#attach_function :print_left,			:TCOD_console_print_left,			[:int, :int, :int, :int, :string],				:void
		#attach_function :print_left_x,			:TCOD_console_print_left,			[:int, :int, :int, :int, :string, :varargs],	:void

		# put_char_ex(console, x, y, c, fore_color, back_color) 
		#attach_function :put_char_ex, :TCOD_console_put_char_ex, [:int, :int, :int, :int, :pointer, :pointer], :void

		# get_char(console, x, y) : int
		#attach_function :get_char, :TCOD_console_get_char, [:int, :int, :int], :int

		# get_back(console, x, y) : color
		#attach_function :get_back, :TCOD_console_get_back, [:int, :int, :int], :pointer

		# rect(console, x, y, width, height, clear, bkgnd_flag)
		#attach_function :rect, :TCOD_console_rect, [:int, :int, :int, :int, :int, :bool, :int], :void

		# print_frame(console, x, y, width, height, clear, flag, string)
		#attach_function :print_frame, :TCOD_console_print_frame, [:int, :int, :int, :int, :int, :bool, :int, :string], :void

		# draw_frame(console, x, y, width, height, clear, flag, int)
		#attach_function :draw_frame, :TCOD_console_print_frame, [:int, :int, :int, :int, :int, :bool, :int, :int], :void
	end
end