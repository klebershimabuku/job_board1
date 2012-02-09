# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "browser_detect"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["rlivsey", "faunzy", "tmlee", "ggilder"]
  s.date = "2011-10-06"
  s.description = "\tSimple rails browser detection based on original plugin by Richard Livsey\"\n"
  s.email = []
  s.homepage = "http://github.com/traction/browser_detect"
  s.require_paths = ["lib"]
  s.rubyforge_project = "browser_detect"
  s.rubygems_version = "1.8.15"
  s.summary = "A simple rails browser detection plugin"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.0.0.rc.6"])
    else
      s.add_dependency(%q<bundler>, [">= 1.0.0.rc.6"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.0.0.rc.6"])
  end
end
