# frozen_string_literal: true

# The command dispatcher for Minitar::CLI. This will be replaced in a future
# version by one of the better-executed CLI application frameworks like GLI,
# after Ruby 1.8 and 1.9 support have been dropped.
class Minitar::CLI::Commander
  attr_reader :commands
  attr_reader :default_command
  attr_reader :ioe

  def initialize(ioe)
    @ioe = default_ioe(ioe)
    @commands = {}
    @default_command = nil
  end

  def register(command)
    command = command.new(self) if command.kind_of?(Class)
    raise CommandAlreadyExists if command.commander != self
    raise CommandAlreadyExists if command?(command.name)

    commands[command.name] = command

    # rubocop:disable Style/GuardClause
    if command.respond_to?(:altname)
      commands[command.altname] = command unless command?(command.altname)
    end
    # rubocop:enable Style/GuardClause
  end

  def default_command=(command)
    command = command.new if command.kind_of?(Class)

    @default_command =
      if command.kind_of?(Minitar::CLI::Command)
        register(command) unless command?(command.name)
        command
      elsif command?(command)
        commands[command]
      else
        raise UnknownCommandError
      end
  end

  def command?(command)
    commands.key?(command)
  end

  def command(command)
    if command?(command)
      commands[command]
    else
      default_command
    end
  end
  alias [] command

  def default_ioe(ioe = {})
    ioe[:input]   ||= $stdin
    ioe[:output]  ||= $stdout
    ioe[:error]   ||= $stderr
    ioe
  end
end
