# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "multi_xml/version"

Gem::Specification.new do |s|
  s.add_development_dependency("bundler", "~> 1.0")
  s.add_development_dependency("libxml-ruby", "~> 1.1")
  s.add_development_dependency("nokogiri", "~> 1.4")
  s.add_development_dependency("rake", "~> 0.8")
  s.add_development_dependency("rcov", "~> 0.9")
  s.add_development_dependency("rspec", "~> 2.0")
  s.name        = "multi_xml"
  s.version     = MultiXml::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Erik Michaels-Ober"]
  s.email       = ["sferik@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/multi_xml"
  s.summary     = %q{A generic swappable back-end for XML parsing}
  s.description = %q{A gem to provide swappable XML backends utilizing LibXML, Nokogiri, or REXML.}
  s.rubyforge_project = "multi_xml"
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
