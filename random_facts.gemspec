# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'random_facts/version'

Gem::Specification.new do |spec|
  spec.name          = "random_facts"
  spec.version       = RandomFacts::VERSION
  spec.authors       = ["Vasilis Kalligas"]
  spec.email         = ["billkall@gmail.com"]
  spec.summary       = %q{A random facts generator}
  spec.description   = %q{A gem to provide random facts based on requested parameters}
  spec.homepage      = "https://github.com/arcanoid/random_facts"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'

  spec.required_ruby_version = '~> 2.2.3'
end
