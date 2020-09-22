# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'soxi/wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "soxi-wrapper"
  spec.version       = Soxi::Wrapper::VERSION
  spec.authors       = ["Claus Witt"]
  spec.email         = ["claus@wittnezz.dk"]
  spec.description   = %q{Wrapper class for calling soxi on files on command line}
  spec.summary       = %q{Use to get information about audio files}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "yarjuf"
end
