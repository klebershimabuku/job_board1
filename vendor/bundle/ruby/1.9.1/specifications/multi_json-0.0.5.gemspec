# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "multi_json"
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Bleigh"]
  s.date = "2010-11-04"
  s.description = "A gem to provide swappable JSON backends utilizing Yajl::Ruby, the JSON gem, ActiveSupport, or JSON pure."
  s.email = ["michael@intridea.com"]
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://github.com/intridea/multi_json"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "A gem to provide swappable JSON backends."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 0.8"])
      s.add_development_dependency(%q<rcov>, ["~> 0.9"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0"])
      s.add_development_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_development_dependency(%q<json>, ["~> 1.4"])
      s.add_development_dependency(%q<json_pure>, ["~> 1.4"])
      s.add_development_dependency(%q<yajl-ruby>, ["~> 0.7"])
    else
      s.add_dependency(%q<rake>, ["~> 0.8"])
      s.add_dependency(%q<rcov>, ["~> 0.9"])
      s.add_dependency(%q<rspec>, ["~> 2.0"])
      s.add_dependency(%q<activesupport>, ["~> 3.0"])
      s.add_dependency(%q<json>, ["~> 1.4"])
      s.add_dependency(%q<json_pure>, ["~> 1.4"])
      s.add_dependency(%q<yajl-ruby>, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 0.8"])
    s.add_dependency(%q<rcov>, ["~> 0.9"])
    s.add_dependency(%q<rspec>, ["~> 2.0"])
    s.add_dependency(%q<activesupport>, ["~> 3.0"])
    s.add_dependency(%q<json>, ["~> 1.4"])
    s.add_dependency(%q<json_pure>, ["~> 1.4"])
    s.add_dependency(%q<yajl-ruby>, ["~> 0.7"])
  end
end
