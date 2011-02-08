# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dircat}
  s.version = "0.1.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tokiro"]
  s.date = %q{2011-02-08}
  s.default_executable = %q{dircat}
  s.description = %q{
      command line utilites to manage catalogs of directory
    }
  s.email = %q{tokiro.oyama@gmail.com}
  s.executables = ["dircat"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION.yml",
    "dircat.gemspec",
    "examples/example.rb",
    "lib/dircat.rb",
    "lib/dircat/cat.rb",
    "lib/dircat/cli/cli_dircat.rb",
    "lib/dircat/cli/command_build.rb",
    "lib/dircat/cli/command_diff.rb",
    "lib/dircat/cli/command_query.rb",
    "lib/dircat/entry.rb",
    "lib/dircat/extension_md5.rb",
    "lib/dircat/extension_numeric.rb",
    "tasks/jeweler.rake",
    "tasks/rspec.rake",
    "tasks/yard.rake"
  ]
  s.homepage = %q{http://github.com/tokiro/dircat}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{command line utilites to manage catalogs of directory}
  s.test_files = [
    "spec/dircat/cat_spec.rb",
    "spec/dircat/cli/cli_dircat_spec.rb",
    "spec/dircat/cli/command_build_spec.rb",
    "spec/dircat/cli/command_diff_spec.rb",
    "spec/dircat/cli/command_query_spec.rb",
    "spec/dircat/md5_spec.rb",
    "spec/dircat/numeric_spec.rb",
    "spec/fixtures/certified_output/dircat1.yaml",
    "spec/fixtures/certified_output/dircat2.yaml",
    "spec/fixtures/dir1/file1.txt",
    "spec/fixtures/dir1/subdir/file3.txt",
    "spec/fixtures/dir2/file1.txt",
    "spec/fixtures/dir2/file2.txt",
    "spec/fixtures/dir2/subdir/file3.txt",
    "spec/fixtures/dir3/file1.txt",
    "spec/fixtures/dir3/subdir/file1.txt",
    "spec/fixtures/tmp/dummy.txt",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<treevisitor>, ["= 0.2.1"])
      s.add_runtime_dependency(%q<optparse-command>, ["= 0.1.4"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<treevisitor>, ["= 0.2.1"])
      s.add_dependency(%q<optparse-command>, ["= 0.1.4"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<treevisitor>, ["= 0.2.1"])
    s.add_dependency(%q<optparse-command>, ["= 0.1.4"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end

