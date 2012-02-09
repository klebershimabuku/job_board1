# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "faraday_middleware"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Wynn Netherland"]
  s.date = "2010-11-30"
  s.description = "Various middleware for Faraday"
  s.email = ["wynn.netherland@gmail.com"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md"]
  s.homepage = "http://wynnnetherland.com/projects/faraday-middleware/"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Various middleware for Faraday"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hashie>, ["~> 0.4"])
      s.add_development_dependency(%q<json>, ["~> 1.4"])
      s.add_development_dependency(%q<multi_json>, ["~> 0.0"])
      s.add_development_dependency(%q<multi_xml>, ["~> 0.2"])
      s.add_development_dependency(%q<oauth2>, ["~> 0.1"])
      s.add_development_dependency(%q<rake>, ["~> 0.8"])
      s.add_development_dependency(%q<shoulda>, ["~> 2.11"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.3"])
      s.add_development_dependency(%q<test-unit>, ["~> 2.1"])
      s.add_runtime_dependency(%q<faraday>, ["~> 0.5.3"])
    else
      s.add_dependency(%q<hashie>, ["~> 0.4"])
      s.add_dependency(%q<json>, ["~> 1.4"])
      s.add_dependency(%q<multi_json>, ["~> 0.0"])
      s.add_dependency(%q<multi_xml>, ["~> 0.2"])
      s.add_dependency(%q<oauth2>, ["~> 0.1"])
      s.add_dependency(%q<rake>, ["~> 0.8"])
      s.add_dependency(%q<shoulda>, ["~> 2.11"])
      s.add_dependency(%q<simplecov>, ["~> 0.3"])
      s.add_dependency(%q<test-unit>, ["~> 2.1"])
      s.add_dependency(%q<faraday>, ["~> 0.5.3"])
    end
  else
    s.add_dependency(%q<hashie>, ["~> 0.4"])
    s.add_dependency(%q<json>, ["~> 1.4"])
    s.add_dependency(%q<multi_json>, ["~> 0.0"])
    s.add_dependency(%q<multi_xml>, ["~> 0.2"])
    s.add_dependency(%q<oauth2>, ["~> 0.1"])
    s.add_dependency(%q<rake>, ["~> 0.8"])
    s.add_dependency(%q<shoulda>, ["~> 2.11"])
    s.add_dependency(%q<simplecov>, ["~> 0.3"])
    s.add_dependency(%q<test-unit>, ["~> 2.1"])
    s.add_dependency(%q<faraday>, ["~> 0.5.3"])
  end
end
