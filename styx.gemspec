# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'styx/version'

Gem::Specification.new do |spec|
  spec.name          = 'styx'
  spec.version       = Styx::VERSION
  spec.authors       = ['seenmyfate']
  spec.email         = ['seenmyfate@gmail.com']
  spec.description   = %q{Easily and selectively do interesting things with the river of data that is your
  MongoDB oplog}
  spec.summary       = %q{Easily and selectively do interesting things with the river of data that is your
  MongoDB oplog}
  spec.homepage      = 'https://github.com/onthebeach/styx'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'mocha'

  spec.add_runtime_dependency 'mongo', '>= 1.7'
  spec.add_runtime_dependency 'bson_ext'
end
