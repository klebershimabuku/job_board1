# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "kaminari"
  s.version = "0.10.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Akira Matsuda"]
  s.date = "2011-02-24"
  s.description = "Kaminari is a Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Rails 3"
  s.email = "ronnie@dio.jp"
  s.extra_rdoc_files = ["LICENSE.txt", "README.rdoc"]
  s.files = ["LICENSE.txt", "README.rdoc"]
  s.homepage = "http://github.com/amatsuda/kaminari"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "A pagination engine plugin for Rails 3"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 2.5.0"])
      s.add_development_dependency(%q<rr>, [">= 1.0.2"])
      s.add_development_dependency(%q<steak>, [">= 1.1.0"])
      s.add_development_dependency(%q<capybara>, [">= 0.4.1.1"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rails>, [">= 0"])
      s.add_development_dependency(%q<rack>, [">= 0"])
      s.add_development_dependency(%q<arel>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 2.5.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 1.3.3"])
      s.add_development_dependency(%q<mongoid>, ["= 2.0.0.rc.7"])
      s.add_development_dependency(%q<bson_ext>, ["~> 1.2"])
      s.add_runtime_dependency(%q<rails>, [">= 3.0.0"])
    else
      s.add_dependency(%q<rspec>, [">= 2.5.0"])
      s.add_dependency(%q<rr>, [">= 1.0.2"])
      s.add_dependency(%q<steak>, [">= 1.1.0"])
      s.add_dependency(%q<capybara>, [">= 0.4.1.1"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rails>, [">= 0"])
      s.add_dependency(%q<rack>, [">= 0"])
      s.add_dependency(%q<arel>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 2.5.0"])
      s.add_dependency(%q<sqlite3>, [">= 1.3.3"])
      s.add_dependency(%q<mongoid>, ["= 2.0.0.rc.7"])
      s.add_dependency(%q<bson_ext>, ["~> 1.2"])
      s.add_dependency(%q<rails>, [">= 3.0.0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 2.5.0"])
    s.add_dependency(%q<rr>, [">= 1.0.2"])
    s.add_dependency(%q<steak>, [">= 1.1.0"])
    s.add_dependency(%q<capybara>, [">= 0.4.1.1"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, [">= 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rails>, [">= 0"])
    s.add_dependency(%q<rack>, [">= 0"])
    s.add_dependency(%q<arel>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 2.5.0"])
    s.add_dependency(%q<sqlite3>, [">= 1.3.3"])
    s.add_dependency(%q<mongoid>, ["= 2.0.0.rc.7"])
    s.add_dependency(%q<bson_ext>, ["~> 1.2"])
    s.add_dependency(%q<rails>, [">= 3.0.0"])
  end
end
