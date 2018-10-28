# -*- encoding: utf-8 -*-
# stub: minitar-cli 0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "minitar-cli".freeze
  s.version = "0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Austin Ziegler".freeze]
  s.date = "2018-10-28"
  s.description = "<tt>minitar-cli</tt> is a pure-Ruby command-line tool that uses\n{minitar}[https://github.com/halostatue/minitar] to provide a command-line\ntool, +minitar+, for working with POSIX tar(1) archive files.\n\nThis is release 0.7, extracted from {minitar}[https://halostatue.ca/minitar],\nwith modernizations.".freeze
  s.email = ["halostatue@gmail.com".freeze]
  s.executables = ["minitar".freeze]
  s.extra_rdoc_files = ["Contributing.md".freeze, "History.md".freeze, "Licence.md".freeze, "Manifest.txt".freeze, "README.rdoc".freeze, "docs/bsdl.txt".freeze, "docs/ruby.txt".freeze]
  s.files = ["Contributing.md".freeze, "History.md".freeze, "Licence.md".freeze, "Manifest.txt".freeze, "README.rdoc".freeze, "Rakefile".freeze, "bin/minitar".freeze, "docs/bsdl.txt".freeze, "docs/ruby.txt".freeze, "lib/minitar/cli.rb".freeze, "lib/minitar/cli/command.rb".freeze, "lib/minitar/cli/command/create.rb".freeze, "lib/minitar/cli/command/extract.rb".freeze, "lib/minitar/cli/command/help.rb".freeze, "lib/minitar/cli/command/list.rb".freeze, "lib/minitar/cli/commander.rb".freeze, "test/fixtures/bad-dir.tar.gz".freeze, "test/fixtures/spaces.tar.gz".freeze, "test/minitest_helper.rb".freeze, "test/support/minitar_cli_test_helper.rb".freeze, "test/test_cli_help.rb".freeze, "test/test_cli_list.rb".freeze]
  s.homepage = "https://github.com/halostatue/minitar-cli/".freeze
  s.licenses = ["Ruby".freeze, "BSD-2-Clause".freeze]
  s.rdoc_options = ["--main".freeze, "README.rdoc".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8".freeze)
  s.rubygems_version = "2.7.7".freeze
  s.summary = "<tt>minitar-cli</tt> is a pure-Ruby command-line tool that uses {minitar}[https://github.com/halostatue/minitar] to provide a command-line tool, +minitar+, for working with POSIX tar(1) archive files".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<minitar>.freeze, ["~> 0.7.0"])
      s.add_runtime_dependency(%q<powerbar>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.11"])
      s.add_development_dependency(%q<hoe-doofus>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-gemspec2>.freeze, ["~> 1.1"])
      s.add_development_dependency(%q<hoe-git>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<hoe-rubygems>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<hoe-travis>.freeze, ["~> 1.2"])
      s.add_development_dependency(%q<minitest-autotest>.freeze, ["< 2", ">= 1.0"])
      s.add_development_dependency(%q<rake>.freeze, ["< 12", ">= 10.0"])
      s.add_development_dependency(%q<rdoc>.freeze, [">= 0.0"])
      s.add_development_dependency(%q<hoe>.freeze, ["~> 3.17"])
    else
      s.add_dependency(%q<minitar>.freeze, ["~> 0.7.0"])
      s.add_dependency(%q<powerbar>.freeze, ["~> 1.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.11"])
      s.add_dependency(%q<hoe-doofus>.freeze, ["~> 1.0"])
      s.add_dependency(%q<hoe-gemspec2>.freeze, ["~> 1.1"])
      s.add_dependency(%q<hoe-git>.freeze, ["~> 1.6"])
      s.add_dependency(%q<hoe-rubygems>.freeze, ["~> 1.0"])
      s.add_dependency(%q<hoe-travis>.freeze, ["~> 1.2"])
      s.add_dependency(%q<minitest-autotest>.freeze, ["< 2", ">= 1.0"])
      s.add_dependency(%q<rake>.freeze, ["< 12", ">= 10.0"])
      s.add_dependency(%q<rdoc>.freeze, [">= 0.0"])
      s.add_dependency(%q<hoe>.freeze, ["~> 3.17"])
    end
  else
    s.add_dependency(%q<minitar>.freeze, ["~> 0.7.0"])
    s.add_dependency(%q<powerbar>.freeze, ["~> 1.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.11"])
    s.add_dependency(%q<hoe-doofus>.freeze, ["~> 1.0"])
    s.add_dependency(%q<hoe-gemspec2>.freeze, ["~> 1.1"])
    s.add_dependency(%q<hoe-git>.freeze, ["~> 1.6"])
    s.add_dependency(%q<hoe-rubygems>.freeze, ["~> 1.0"])
    s.add_dependency(%q<hoe-travis>.freeze, ["~> 1.2"])
    s.add_dependency(%q<minitest-autotest>.freeze, ["< 2", ">= 1.0"])
    s.add_dependency(%q<rake>.freeze, ["< 12", ">= 10.0"])
    s.add_dependency(%q<rdoc>.freeze, [">= 0.0"])
    s.add_dependency(%q<hoe>.freeze, ["~> 3.17"])
  end
end
