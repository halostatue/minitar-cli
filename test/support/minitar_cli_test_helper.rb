# frozen_string_literal: true

require "minitar/cli"

module MinitarCLITestHelper
  def cli(*args)
    Minitar::CLI.run(args)
  end

  def r(*r)
    Regexp.union(*r)
  end

  def assert_cli_output(first, last, &block)
    out, _err = capture_io(&block)
    assert_match first, out, "first line of output"
    assert_match last, out, "last line of output"
  end

  Minitest::Test.send(:include, self)
end
