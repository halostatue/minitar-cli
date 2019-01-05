# frozen_string_literal: true

require 'minitar'

# The Minitar command-line application.
class Minitar::CLI
  VERSION = '0.8'.freeze #:nodoc:

  # rubocop:disable Lint/InheritException
  class AbstractCommandError < Exception; end
  # rubocop:enable Lint/InheritException
  class UnknownCommandError < StandardError; end
  class CommandAlreadyExists < StandardError; end

  def self.run(argv, input = $stdin, output = $stdout, error = $stderr)
    new(input, output, error).run(argv)
  end

  attr_reader :commander
  attr_reader :ioe

  def initialize(input = $stdin, output = $stdout, error = $stderr)
    @ioe = {
      :input  => input,
      :output => output,
      :error  => error
    }
    @commander = Minitar::CLI::Commander.new(ioe)
    Minitar::CLI::Command.children.each do |command|
      commander.register(command)
    end
    commander.default_command = 'help'
  end

  def run(argv)
    opts = {}

    output << "minitar #{VERSION}\n" if argv.include?('--version')

    if argv.include?('--verbose') or argv.include?('-V')
      opts[:verbose] = true
      argv.delete('--verbose')
      argv.delete('-V')
    end

    if argv.include?('--progress') or argv.include?('-P')
      opts[:progress] = true
      opts[:verbose]  = false
      argv.delete('--progress')
      argv.delete('-P')
    end

    command = commander[(argv.shift or '').downcase]
    command ||= commander['help']
    command.call(argv, opts)
  end
end

require 'minitar/cli/command'
require 'minitar/cli/commander'
require 'minitar/cli/command/help'
require 'minitar/cli/command/create'
require 'minitar/cli/command/extract'
require 'minitar/cli/command/list'
