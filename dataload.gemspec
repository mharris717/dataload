# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dataload}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Harris"]
  s.date = %q{2009-03-11}
  s.email = %q{GFunk913@gmail.com}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["README.rdoc", "VERSION.yml", "lib/dataload", "lib/dataload/db.sqlite3", "lib/dataload/loader.rb", "lib/dataload/source.csv", "lib/dataload.rb", "spec/dataload_spec.rb", "spec/spec_helper.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/GFunk911/dataload}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.add_dependency 'GFunk911-mharris_ext'
  s.add_dependency 'activerecord'
  s.add_dependency 'fastercsv'

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
