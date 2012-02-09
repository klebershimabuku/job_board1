# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "simple_form"
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jos\u{c3}\u{a9} Valim", "Carlos Ant\u{c3}\u{b4}nio"]
  s.date = "2010-12-08"
  s.description = "Forms made easy!"
  s.email = "contact@plataformatec.com.br"
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/plataformatec/simple_form"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Forms made easy!"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.0.0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.0.0"])
  end
end
