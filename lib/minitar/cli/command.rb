# frozen_string_literal: true

# The base for commands in Minitar::CLI. This will be replaced in a future
# version by one of the better-executed CLI application frameworks like GLI,
# after Ruby 1.8 and 1.9 support have been dropped.
class Minitar::CLI::Command
  @children = []

  attr_reader :commander
  attr_reader :ioe

  class << self
    attr_reader :children

    def inherited(subclass)
      children << subclass
    end
  end

  module CatchMinitarErrors # :nodoc:
    def call(args, opts)
      run(args, opts)
    rescue Archive::Tar::Minitar::Error => error
      ioe[:error] << "#{error}\n"
      5
    end
  end

  def initialize(commander)
    @commander = commander
    @ioe = commander.ioe
  end

  def name
    raise Minitar::CLI::AbstractCommandError
  end

  def call(_args, _opts = {})
    raise Minitar::CLI::AbstractCommandError
  end
  alias [] call

  def help
    raise Minitar::CLI::AbstractCommandError
  end
end
