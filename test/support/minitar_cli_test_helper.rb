# frozen_string_literal: true

require "minitar/cli"

module MinitarCLITestHelper
  def cli(*args)
    Minitar::CLI.run(args)
  end

  def r(*r)
    Regexp.union(*r)
  end

  def assert_cli_output(patterns, &)
    if patterns.is_a?(Array)
      out, _err = capture_io(&)
      patterns.each do |pattern|
        assert_match pattern, out
      end
    else
      assert_output(patterns, &)
    end
  end

  Minitest::Test.send(:include, self)
end
