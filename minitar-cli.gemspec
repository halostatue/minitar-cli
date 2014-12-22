# -*- encoding: utf-8 -*-
# stub: minitar-cli 0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "minitar-cli"
  s.version = "0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Austin Ziegler"]
  s.date = "2014-12-22"
  s.description = "<tt>minitar-cli</tt> is a pure-Ruby command-line tool that uses\n{minitar}[https://github.com/halostatue/minitar] to provide a command-line\ntool, +minitar+, for working with POSIX tar(1) archive files.\n\nThis is release 0.6, extracted from {minitar}[https://halostatue.ca/minitar],\nwith modernizations."
  s.email = ["halostatue@gmail.com"]
  s.executables = ["minitar"]
  s.extra_rdoc_files = ["Contributing.rdoc", "History.rdoc", "Licence.rdoc", "Manifest.txt", "README.rdoc", "docs/bsdl.txt", "docs/ruby.txt", "Contributing.rdoc", "History.rdoc", "Licence.rdoc", "README.rdoc"]
  s.files = [".autotest", ".gemtest", ".gitignore", ".hoerc", "Contributing.rdoc", "History.rdoc", "Licence.rdoc", "Manifest.txt", "README.rdoc", "Rakefile", "bin/minitar", "docs/bsdl.txt", "docs/ruby.txt", "lib/minitar-cli.rb", "lib/minitar/cli.rb", "test/minitest_helper.rb"]
  s.homepage = "https://github.com/halostatue/minitar-cli/"
  s.licenses = ["Ruby", "BSD-2-Clause"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8")
  s.rubygems_version = "2.4.2"
  s.summary = "<tt>minitar-cli</tt> is a pure-Ruby command-line tool that uses {minitar}[https://github.com/halostatue/minitar] to provide a command-line tool, +minitar+, for working with POSIX tar(1) archive files"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<archive-tar-minitar>, ["~> 0.6.0"])
      s.add_runtime_dependency(%q<powerbar>, ["~> 1.0"])
      s.add_development_dependency(%q<minitest>, ["~> 5.4"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe-doofus>, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-gemspec2>, ["~> 1.1"])
      s.add_development_dependency(%q<hoe-git>, ["~> 1.6"])
      s.add_development_dependency(%q<hoe-rubygems>, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-travis>, ["~> 1.2"])
      s.add_development_dependency(%q<minitest-autotest>, ["< 2", ">= 1.0.b"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.7"])
      s.add_development_dependency(%q<coveralls>, ["~> 0.7"])
      s.add_development_dependency(%q<hoe>, ["~> 3.13"])
    else
      s.add_dependency(%q<archive-tar-minitar>, ["~> 0.6.0"])
      s.add_dependency(%q<powerbar>, ["~> 1.0"])
      s.add_dependency(%q<minitest>, ["~> 5.4"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe-doofus>, ["~> 1.0"])
      s.add_dependency(%q<hoe-gemspec2>, ["~> 1.1"])
      s.add_dependency(%q<hoe-git>, ["~> 1.6"])
      s.add_dependency(%q<hoe-rubygems>, ["~> 1.0"])
      s.add_dependency(%q<hoe-travis>, ["~> 1.2"])
      s.add_dependency(%q<minitest-autotest>, ["< 2", ">= 1.0.b"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<simplecov>, ["~> 0.7"])
      s.add_dependency(%q<coveralls>, ["~> 0.7"])
      s.add_dependency(%q<hoe>, ["~> 3.13"])
    end
  else
    s.add_dependency(%q<archive-tar-minitar>, ["~> 0.6.0"])
    s.add_dependency(%q<powerbar>, ["~> 1.0"])
    s.add_dependency(%q<minitest>, ["~> 5.4"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe-doofus>, ["~> 1.0"])
    s.add_dependency(%q<hoe-gemspec2>, ["~> 1.1"])
    s.add_dependency(%q<hoe-git>, ["~> 1.6"])
    s.add_dependency(%q<hoe-rubygems>, ["~> 1.0"])
    s.add_dependency(%q<hoe-travis>, ["~> 1.2"])
    s.add_dependency(%q<minitest-autotest>, ["< 2", ">= 1.0.b"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<simplecov>, ["~> 0.7"])
    s.add_dependency(%q<coveralls>, ["~> 0.7"])
    s.add_dependency(%q<hoe>, ["~> 3.13"])
  end
end
