# -*- ruby -*-

# NOTE: This file is present to keep Travis CI happy. Edits to it will not
# be accepted.

source 'https://rubygems.org/'

mime_version =
  if RUBY_VERSION < '1.9'
    gem 'rdoc', '< 4.0'
    gem 'rake', '~> 10.0'
    '1.25'
  elsif RUBY_VERSION < '2.0'
    '2.0'
  elsif RUBY_VERSION >= '2.0'
    if RUBY_ENGINE == 'ruby'
      gem 'byebug' if ENV['DEV']
      gem 'simplecov', '~> 0.7'
      gem 'coveralls', '~> 0.7'
    end
    '3.0'
  end

gem 'mime-types', "~> #{mime_version}"

gem 'minitar', :path => '../minitar' if ENV['DEV']

gemspec

# vim: syntax=ruby
