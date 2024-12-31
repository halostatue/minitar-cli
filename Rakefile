# -*- ruby encoding: utf-8 -*-

require "rubygems"
require "hoe"
require "rake/clean"

Hoe.plugin :halostatue
Hoe.plugin :minitest

Hoe.plugins.delete :debug
Hoe.plugins.delete :newb
Hoe.plugins.delete :publish
Hoe.plugins.delete :signing

Hoe.spec "minitar-cli" do
  developer("Austin Ziegler", "halostatue@gmail.com")

  require_ruby_version ">= 3.1"

  self.licenses = ["Ruby", "BSD-2-Clause"]

  spec_extras[:metadata] = ->(val) {
    val["rubygems_mfa_required"] = "true"
  }

  extra_deps << ["minitar", "~> 1.0.0"]
  extra_deps << ["powerbar", "~> 1.0"]

  extra_dev_deps << ["hoe", "~> 4.0"]
  extra_dev_deps << ["hoe-halostatue", "~> 1.0"]
  extra_dev_deps << ["minitest", "~> 5.16"]
  extra_dev_deps << ["minitest-autotest", "~> 1.0"]
  extra_dev_deps << ["minitest-focus", "~> 1.0"]
  extra_dev_deps << ["rake", ">= 10.0", "< 14"]
  extra_dev_deps << ["standard", "~> 1.0"]
  extra_dev_deps << ["standard-minitest", "~> 1.0"]
  extra_dev_deps << ["standard-thread_safety", "~> 1.0"]
end
