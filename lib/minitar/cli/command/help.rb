# frozen_string_literal: true

# Help command. This will be replaced in a future version by one of the
# better-executed CLI application frameworks like GLI, after Ruby 1.8 and 1.9
# support have been dropped.
class Minitar::CLI::Command::Help < Minitar::CLI::Command
  def name
    'help'
  end

  COMMANDS = <<-EOS.freeze
The commands known to minitar are:

    minitar create          Creates a new tarfile.
    minitar extract         Extracts files from a tarfile.
    minitar list            Lists files in the tarfile.

All commands accept the options --verbose and --progress, which are
mutually exclusive. In "minitar list", --progress means the same as
--verbose.

  --verbose, -V     Performs the requested command verbosely.
  --progress, -P    Shows a progress bar, if appropriate, for the action
                    being performed.

  EOS

  BASIC = <<-EOS.freeze
This is a basic help message containing pointers to more information on
how to use this command-line tool. Try:

    minitar help commands       list all 'minitar' commands
    minitar help <COMMAND>      show help on <COMMAND>
                                  (e.g., 'minitar help create')
EOS

  def call(args, _opts = {})
    help_on = args.shift

    if commander.command?(help_on)
      ioe[:output] << commander[help_on].help
    elsif help_on == 'commands'
      ioe[:output] << COMMANDS
    else
      unless help_on.nil? or help_on.empty?
        ioe[:output] << "Unknown command: #{help_on}\n"
      end
      ioe[:output] << help
    end

    0
  end

  def help
    BASIC
  end
end
