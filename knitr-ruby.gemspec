# -*- encoding: utf-8 -*-
require File.expand_path("../lib/knitr-ruby/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'knitr-ruby'
  s.version     = KnitrRuby::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Martin Fenner", "Gavin Simpson", "Carl Boettiger"]
  s.email       = 'mf@martinfenner.org'
  s.homepage    = 'https://github.com/ropensci/knitr-ruby'
  s.summary     = 'Ruby wrapper for knitr R package'
  s.description = 'A Ruby wrapper for the knitr R package which processes markdown with embedded code.'
  s.license     = 'MIT'

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rspec", "~> 2.6"

  s.files       = ['lib/knitr-ruby.rb','lib/knitr-ruby/knitr.rb','lib/knitr-ruby/version.rb','lib/knitr-ruby/knitrscript.R']
end