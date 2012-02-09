# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "twitter"
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Nunemaker", "Wynn Netherland", "Erik Michaels-Ober", "Steve Richert"]
  s.date = "2011-01-16"
  s.description = "A Ruby wrapper for the Twitter REST and Search APIs"
  s.email = ["nunemaker@gmail.com", "wynn.netherland@gmail.com", "sferik@gmail.com", "steve.richert@gmail.com"]
  s.homepage = "https://github.com/jnunemaker/twitter"
  s.post_install_message = "********************************************************************************\n\n  Follow @gem on Twitter for announcements, updates, and news.\n  https://twitter.com/gem\n\n  Join the mailing list!\n  https://groups.google.com/group/ruby-twitter-gem\n\n  Add your project or organization to the apps wiki!\n  https://github.com/jnunemaker/twitter/wiki/apps\n\n********************************************************************************\n"
  s.require_paths = ["lib"]
  s.rubyforge_project = "twitter"
  s.rubygems_version = "1.8.15"
  s.summary = "Ruby wrapper for the Twitter API"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<json>, ["~> 1.4"])
      s.add_development_dependency(%q<nokogiri>, ["~> 1.4"])
      s.add_development_dependency(%q<maruku>, ["~> 0.6"])
      s.add_development_dependency(%q<rake>, ["~> 0.8"])
      s.add_development_dependency(%q<rspec>, ["~> 2.4"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.3"])
      s.add_development_dependency(%q<webmock>, ["~> 1.6"])
      s.add_development_dependency(%q<yard>, ["~> 0.6"])
      s.add_development_dependency(%q<ZenTest>, ["~> 4.4"])
      s.add_runtime_dependency(%q<hashie>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<faraday>, ["~> 0.5.4"])
      s.add_runtime_dependency(%q<faraday_middleware>, ["~> 0.3.1"])
      s.add_runtime_dependency(%q<multi_json>, ["~> 0.0.5"])
      s.add_runtime_dependency(%q<multi_xml>, ["~> 0.2.0"])
      s.add_runtime_dependency(%q<simple_oauth>, ["~> 0.1.3"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<json>, ["~> 1.4"])
      s.add_dependency(%q<nokogiri>, ["~> 1.4"])
      s.add_dependency(%q<maruku>, ["~> 0.6"])
      s.add_dependency(%q<rake>, ["~> 0.8"])
      s.add_dependency(%q<rspec>, ["~> 2.4"])
      s.add_dependency(%q<simplecov>, ["~> 0.3"])
      s.add_dependency(%q<webmock>, ["~> 1.6"])
      s.add_dependency(%q<yard>, ["~> 0.6"])
      s.add_dependency(%q<ZenTest>, ["~> 4.4"])
      s.add_dependency(%q<hashie>, ["~> 0.4.0"])
      s.add_dependency(%q<faraday>, ["~> 0.5.4"])
      s.add_dependency(%q<faraday_middleware>, ["~> 0.3.1"])
      s.add_dependency(%q<multi_json>, ["~> 0.0.5"])
      s.add_dependency(%q<multi_xml>, ["~> 0.2.0"])
      s.add_dependency(%q<simple_oauth>, ["~> 0.1.3"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<json>, ["~> 1.4"])
    s.add_dependency(%q<nokogiri>, ["~> 1.4"])
    s.add_dependency(%q<maruku>, ["~> 0.6"])
    s.add_dependency(%q<rake>, ["~> 0.8"])
    s.add_dependency(%q<rspec>, ["~> 2.4"])
    s.add_dependency(%q<simplecov>, ["~> 0.3"])
    s.add_dependency(%q<webmock>, ["~> 1.6"])
    s.add_dependency(%q<yard>, ["~> 0.6"])
    s.add_dependency(%q<ZenTest>, ["~> 4.4"])
    s.add_dependency(%q<hashie>, ["~> 0.4.0"])
    s.add_dependency(%q<faraday>, ["~> 0.5.4"])
    s.add_dependency(%q<faraday_middleware>, ["~> 0.3.1"])
    s.add_dependency(%q<multi_json>, ["~> 0.0.5"])
    s.add_dependency(%q<multi_xml>, ["~> 0.2.0"])
    s.add_dependency(%q<simple_oauth>, ["~> 0.1.3"])
  end
end
