# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubylike/version'

Gem::Specification.new do |gem|
  gem.name            = "rubylike"
  gem.version         = Rubylike::VERSION
  gem.authors         = ["Norbert Melzer"]
  gem.email           = ["timmelzer@gmail.com"]
  gem.description     = %q{This is a wrapper to libTCOD.}
  gem.summary         = %q{This is a wrapper to libTCOD.}
  gem.homepage        = "https://github.com/NobbZ/rubylike"

  gem.files           = `git ls-files`.split($/)
  gem.executables     = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files      = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths   = ["lib"]

  gem.add_dependency  'ffi'
end
