# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'resque/version'

Gem::Specification.new do |spec|
  spec.name          = "resque"
  spec.version       = Resque::VERSION
  spec.authors       = ["Steve Klabnik"]
  spec.email         = ["steve@steveklabnik.com"]
  spec.description   = %q{Resque is a Redis-backed Ruby library for creating background jobs, using Resque as a queueing system.}
  spec.summary       = %q{Resque is a Redis-backed Ruby library for creating background jobs.}
  spec.homepage      = "https://github.com/defunkt/resque"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
