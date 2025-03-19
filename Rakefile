require "rubygems"
require "hoe"
require "rake/clean"
require "minitest"

Hoe.plugin :halostatue
Hoe.plugin :rubygems

Hoe.plugins.delete :debug
Hoe.plugins.delete :newb
Hoe.plugins.delete :publish
Hoe.plugins.delete :signing

Hoe.spec "minitar-cli" do
  developer("Austin Ziegler", "halostatue@gmail.com")

  self.trusted_release = ENV["rubygems_release_gem"] == "true"

  require_ruby_version ">= 3.1"

  self.licenses = ["Ruby", "BSD-2-Clause"]

  spec_extras[:metadata] = ->(val) {
    val.merge!({"rubygems_mfa_required" => "true"})
  }

  extra_deps << ["minitar", "~> 1.0.0"]
  extra_deps << ["powerbar", "~> 1.0"]

  extra_dev_deps << ["hoe", "~> 4.0"]
  extra_dev_deps << ["hoe-halostatue", "~> 2.0"]
  extra_dev_deps << ["hoe-rubygems", "~> 1.0"]
  extra_dev_deps << ["minitest", "~> 5.16"]
  extra_dev_deps << ["minitest-autotest", "~> 1.0"]
  extra_dev_deps << ["minitest-focus", "~> 1.0"]
  extra_dev_deps << ["rake", ">= 10.0", "< 14"]
  extra_dev_deps << ["standard", "~> 1.0"]
  extra_dev_deps << ["standard-minitest", "~> 1.0"]
  extra_dev_deps << ["standard-thread_safety", "~> 1.0"]
end

Minitest::TestTask.create :test
Minitest::TestTask.create :coverage do |t|
  formatters = <<-RUBY.split($/).join(" ")
    SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::LcovFormatter,
      SimpleCov::Formatter::SimpleFormatter
    ])
  RUBY
  t.test_prelude = <<-RUBY.split($/).join("; ")
  require "simplecov"
  require "simplecov-lcov"

  SimpleCov::Formatter::LcovFormatter.config do |config|
    config.report_with_single_file = true
    config.lcov_file_name = "lcov.info"
  end

  SimpleCov.start "test_frameworks" do
    enable_coverage :branch
    primary_coverage :branch
    formatter #{formatters}
  end
  RUBY
end
