# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "acts_as_commentable"
  s.version = "3.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Cosmin Radoi, Jack Dempsey, Xelipe, Chris Eppstein"]
  s.autorequire = "acts_as_commentable"
  s.date = "2010-10-28"
  s.description = "Plugin/gem that provides comment functionality"
  s.email = "unknown@juixe.com"
  s.extra_rdoc_files = ["README.rdoc", "MIT-LICENSE"]
  s.files = ["README.rdoc", "MIT-LICENSE"]
  s.homepage = "http://www.juixe.com/techknow/index.php/2006/06/18/acts-as-commentable-plugin/"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Plugin/gem that provides comment functionality"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
