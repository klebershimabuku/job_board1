# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rspec-core"
  s.version = "2.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chad Humphries", "David Chelimsky"]
  s.date = "2010-12-16"
  s.description = "RSpec runner and example groups"
  s.email = "dchelimsky@gmail.com;chad.humphries@gmail.com"
  s.executables = ["autospec", "rspec"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["bin/autospec", "bin/rspec", "README.md"]
  s.homepage = "http://github.com/rspec/rspec-core"
  s.post_install_message = "**************************************************\n\n  Thank you for installing rspec-core-2.3.1\n\n  Please be sure to look at the upgrade instructions to see what might have\n  changed since the last release:\n\n  http://github.com/rspec/rspec-core/blob/master/Upgrade.markdown\n\n**************************************************\n"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "rspec"
  s.rubygems_version = "1.8.15"
  s.summary = "rspec-core-2.3.1"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
