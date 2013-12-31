# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'codemodels/xml/version'

Gem::Specification.new do |s|
  s.platform    = 'java'
  s.name        = 'codemodels-xml'
  s.version     = CodeModels::Xml::VERSION
  s.date        = '2013-12-31'
  s.summary     = "CodeModels plugin for XML files."
  s.description = "CodeModels plugin for XML files."
  s.authors     = ["Federico Tomassetti"]
  s.email       = 'https://github.com/ftomassetti/codemodels-xml'
  s.homepage    = 'http://federico-tomassetti.it'
  s.license     = "APACHE 2"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency('codemodels')
  s.add_dependency('nokogiri')

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
  s.add_development_dependency "rubygems-tasks"
  s.add_development_dependency "simplecov"  
end