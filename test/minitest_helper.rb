# -*- ruby encoding: utf-8 -*-

require "fileutils"
require "minitar"

gem "minitest"
require "minitest/autorun"
require "minitest/focus"

Dir.glob(File.join(File.dirname(__FILE__), "support/*.rb")).sort.each do |support|
  require support
end

if ENV["STRICT"]
  $VERBOSE = true
  Warning[:deprecated] = true
  require "minitest/error_on_warning"
end
