# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "simple_oauth"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steve Richert"]
  s.date = "2010-11-30"
  s.description = "Simply builds and verifies OAuth headers"
  s.email = "steve.richert@gmail.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/laserlemon/simple_oauth"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Simply builds and verifies OAuth headers"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<mocha>, [">= 0"])
    else
      s.add_dependency(%q<mocha>, [">= 0"])
    end
  else
    s.add_dependency(%q<mocha>, [">= 0"])
  end
end
