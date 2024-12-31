# -*- encoding: utf-8 -*-
# stub: minitar-cli 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "minitar-cli".freeze
  s.version = "1.0.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/halostatue/minitar-cli/issues", "homepage_uri" => "https://github.com/halostatue/minitar-cli", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/halostatue/minitar-cli" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Austin Ziegler".freeze]
  s.date = "2024-12-31"
  s.description = "`minitar-cli` is a pure-Ruby command-line tool that uses [minitar][minitar] to\nprovide a command-line tool, `minitar`, for working with POSIX tar(1) archive\nfiles.".freeze
  s.email = ["halostatue@gmail.com".freeze]
  s.executables = ["minitar".freeze]
  s.extra_rdoc_files = ["CHANGELOG.md".freeze, "CODE_OF_CONDUCT.md".freeze, "CONTRIBUTING.md".freeze, "CONTRIBUTORS.md".freeze, "LICENCE.md".freeze, "Manifest.txt".freeze, "README.md".freeze, "SECURITY.md".freeze, "docs/bsdl.txt".freeze, "docs/ruby.txt".freeze]
  s.files = ["CHANGELOG.md".freeze, "CODE_OF_CONDUCT.md".freeze, "CONTRIBUTING.md".freeze, "CONTRIBUTORS.md".freeze, "LICENCE.md".freeze, "Manifest.txt".freeze, "README.md".freeze, "Rakefile".freeze, "SECURITY.md".freeze, "bin/minitar".freeze, "docs/bsdl.txt".freeze, "docs/ruby.txt".freeze, "lib/minitar/cli.rb".freeze, "lib/minitar/cli/command.rb".freeze, "lib/minitar/cli/command/create.rb".freeze, "lib/minitar/cli/command/extract.rb".freeze, "lib/minitar/cli/command/help.rb".freeze, "lib/minitar/cli/command/list.rb".freeze, "lib/minitar/cli/commander.rb".freeze, "test/fixtures/bad-dir.tar.gz".freeze, "test/fixtures/spaces.tar.gz".freeze, "test/minitest_helper.rb".freeze, "test/support/minitar_cli_test_helper.rb".freeze, "test/test_cli_help.rb".freeze, "test/test_cli_list.rb".freeze]
  s.homepage = "https://github.com/halostatue/minitar-cli".freeze
  s.licenses = ["Ruby".freeze, "BSD-2-Clause".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 3.1".freeze)
  s.rubygems_version = "3.5.23".freeze
  s.summary = "`minitar-cli` is a pure-Ruby command-line tool that uses [minitar][minitar] to provide a command-line tool, `minitar`, for working with POSIX tar(1) archive files.".freeze

  s.specification_version = 4

  s.add_runtime_dependency(%q<minitar>.freeze, ["~> 1.0.0".freeze])
  s.add_runtime_dependency(%q<powerbar>.freeze, ["~> 1.0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.25".freeze])
  s.add_development_dependency(%q<hoe>.freeze, ["~> 4.0".freeze])
  s.add_development_dependency(%q<hoe-halostatue>.freeze, ["~> 1.0".freeze])
  s.add_development_dependency(%q<minitest-autotest>.freeze, ["~> 1.0".freeze])
  s.add_development_dependency(%q<minitest-focus>.freeze, ["~> 1.0".freeze])
  s.add_development_dependency(%q<rake>.freeze, [">= 10.0".freeze, "< 14".freeze])
  s.add_development_dependency(%q<standard>.freeze, ["~> 1.0".freeze])
end
