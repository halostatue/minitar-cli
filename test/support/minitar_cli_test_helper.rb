# frozen_string_literal: true

require 'minitar/cli'

module MinitarCLITestHelper
  def cli(*args)
    Minitar::CLI.run(args)
  end

  def r(*r)
    Regexp.union(*r)
  end

  Minitest::Test.send(:include, self)
end
