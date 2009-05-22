# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dircat}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tokiro"]
  s.date = %q{2009-05-22}
  s.email = %q{tokiro.oyama@gmail.com}
  s.executables = ["dircat_build.bat", "dircat_build.rb", "dircat_cfr.rb", "dircat_cmp.rb", "dircat_query.rb"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".autotest",
     ".gitignore",
     "History.txt",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "TODO.rdoc",
     "VERSION",
     "bin/dircat_build.bat",
     "bin/dircat_build.rb",
     "bin/dircat_cfr.rb",
     "bin/dircat_cmp.rb",
     "bin/dircat_query.rb",
     "lib/dircat.rb",
     "lib/dircat/cli/dircat_build.rb",
     "lib/dircat/cli/dircat_cfr.rb",
     "lib/dircat/cli/dircat_cmp.rb",
     "lib/dircat/cli/dircat_query.rb",
     "lib/dircat/dircat.rb",
     "nbproject/configs/tc_dircat.properties",
     "nbproject/configs/tc_dircat_build.properties",
     "nbproject/configs/ts_dircat.properties",
     "nbproject/private/config.properties",
     "nbproject/private/configs/tc_dircat_build.properties",
     "nbproject/private/private.properties",
     "nbproject/private/private.xml",
     "nbproject/private/rake-d.txt",
     "nbproject/project.properties",
     "nbproject/project.xml",
     "test/dircat/data/certified_output/dircat1.yaml",
     "test/dircat/data/certified_output/dircat2.yaml",
     "test/dircat/data/dir1/file1.txt",
     "test/dircat/data/dir1/subdir/file3.txt",
     "test/dircat/data/dir2/file1.txt",
     "test/dircat/data/dir2/file2.txt",
     "test/dircat/data/dir2/subdir/file3.txt",
     "test/dircat/data/dir3/file1.txt",
     "test/dircat/data/dir3/subdir/file1.txt",
     "test/dircat/tc_dircat.rb",
     "test/dircat/tc_dircat_build.rb",
     "test/test_dircat.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/tokiro/dircat}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "test/dircat/tc_dircat.rb",
     "test/dircat/tc_dircat_build.rb",
     "test/test_dircat.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
