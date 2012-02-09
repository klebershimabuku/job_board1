# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "fb_graph"
  s.version = "2.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["nov matake"]
  s.date = "2011-11-09"
  s.description = "A full-stack Facebook Graph API wrapper in Ruby."
  s.email = "nov@matake.jp"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/nov/fb_graph"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "A full-stack Facebook Graph API wrapper in Ruby."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httpclient>, [">= 2.2.0.2"])
      s.add_runtime_dependency(%q<rack-oauth2>, [">= 0.9.4"])
      s.add_development_dependency(%q<rake>, [">= 0.8"])
      s.add_development_dependency(%q<cover_me>, [">= 1.2.0"])
      s.add_development_dependency(%q<rspec>, [">= 2"])
      s.add_development_dependency(%q<webmock>, [">= 1.6.2"])
      s.add_development_dependency(%q<actionpack>, [">= 3.0.6"])
    else
      s.add_dependency(%q<httpclient>, [">= 2.2.0.2"])
      s.add_dependency(%q<rack-oauth2>, [">= 0.9.4"])
      s.add_dependency(%q<rake>, [">= 0.8"])
      s.add_dependency(%q<cover_me>, [">= 1.2.0"])
      s.add_dependency(%q<rspec>, [">= 2"])
      s.add_dependency(%q<webmock>, [">= 1.6.2"])
      s.add_dependency(%q<actionpack>, [">= 3.0.6"])
    end
  else
    s.add_dependency(%q<httpclient>, [">= 2.2.0.2"])
    s.add_dependency(%q<rack-oauth2>, [">= 0.9.4"])
    s.add_dependency(%q<rake>, [">= 0.8"])
    s.add_dependency(%q<cover_me>, [">= 1.2.0"])
    s.add_dependency(%q<rspec>, [">= 2"])
    s.add_dependency(%q<webmock>, [">= 1.6.2"])
    s.add_dependency(%q<actionpack>, [">= 3.0.6"])
  end
end
