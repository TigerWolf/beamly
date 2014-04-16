# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'zeebox/version'

Gem::Specification.new do |spec|
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_dependency "curb"
  spec.add_dependency "hashie"
  spec.authors = ["Kieran Anddrews"]
  spec.description = %q{Simple wrapper for the Zeebox API}
  spec.email = ['hiddentiger@gmail.com']
  spec.files = %w(Readme.md zeebox.gemspec)
  spec.files += Dir.glob("lib/**/*.rb")
  spec.homepage = 'https://github.com/TigerWolf/zeebox'
  spec.licenses = ['MIT']
  spec.name = 'zeebox'
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 1.9.2'
  spec.required_rubygems_version = '>= 1.3.5'
  spec.summary = "Ruby toolkit for working with the Zeebox API"
  spec.version = Zeebox::VERSION.dup
end
