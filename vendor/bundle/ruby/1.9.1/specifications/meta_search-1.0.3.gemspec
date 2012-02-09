# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "meta_search"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ernie Miller"]
  s.date = "2011-03-14"
  s.description = "\n      Allows simple search forms to be created against an AR3 model\n      and its associations, has useful view helpers for sort links\n      and multiparameter fields as well.\n    "
  s.email = "ernie@metautonomo.us"
  s.extra_rdoc_files = ["LICENSE", "README.rdoc"]
  s.files = ["LICENSE", "README.rdoc"]
  s.homepage = "http://metautonomo.us/projects/metasearch/"
  s.post_install_message = "\n*** Thanks for installing MetaSearch! ***\nBe sure to check out http://metautonomo.us/projects/metasearch/ for a\nwalkthrough of MetaSearch's features, and click the donate button if\nyou're feeling especially appreciative. It'd help me justify this\n\"open source\" stuff to my lovely wife. :)\n\n"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Object-based searching (and more) for simply creating search forms."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_runtime_dependency(%q<activerecord>, ["~> 3.0.2"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0.2"])
      s.add_runtime_dependency(%q<actionpack>, ["~> 3.0.2"])
      s.add_runtime_dependency(%q<arel>, ["~> 2.0.2"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<activerecord>, ["~> 3.0.2"])
      s.add_dependency(%q<activesupport>, ["~> 3.0.2"])
      s.add_dependency(%q<actionpack>, ["~> 3.0.2"])
      s.add_dependency(%q<arel>, ["~> 2.0.2"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<activerecord>, ["~> 3.0.2"])
    s.add_dependency(%q<activesupport>, ["~> 3.0.2"])
    s.add_dependency(%q<actionpack>, ["~> 3.0.2"])
    s.add_dependency(%q<arel>, ["~> 2.0.2"])
  end
end
