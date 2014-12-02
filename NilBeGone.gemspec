# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'NilBeGone/version'

Gem::Specification.new do |spec|
  spec.name = 'NilBeGone'
  spec.version = NilBeGone::VERSION
  spec.authors = ['Matt Cassidy']
  spec.email = ['mc11235@gmail.com']
  spec.summary = %q{Nil is a pain so stop it}
  spec.description = %q{Allow nil to be temporarily changed to nil_value in the context of the call stack}
  spec.homepage = ''
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'binding_of_caller'
end
