# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "url_shortener"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nasir Jamal"]
  s.date = "2009-11-15"
  s.description = "Url Shortener is a Ruby library / gem and API wrapper for bit.ly to shorten/expand the urls and retrieve other information about them."
  s.email = "nas35_in@yahoo.com"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/nas/url_shortener"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8")
  s.rubygems_version = "1.8.15"
  s.summary = "Url Shortener is a Ruby library / gem and API wrapper for bit.ly"

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0.4.5"])
    else
      s.add_dependency(%q<httparty>, [">= 0.4.5"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0.4.5"])
  end
end
