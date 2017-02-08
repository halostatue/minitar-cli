# frozen_string_literal: true

# Tarball creation command. This will be replaced in a future version by one of
# the better-executed CLI application frameworks like GLI, after Ruby 1.8 and
# 1.9 support have been dropped.
class Minitar::CLI::Command::Create < Minitar::CLI::Command
  def name
    'create'
  end

  def altname
    'cr'
  end

  HELP = <<-EOH.freeze
    minitar create [OPTIONS] <tarfile|-> <file|directory|-->+

Creates a new tarfile. If the tarfile is named .tar.gz or .tgz, then it
will be compressed automatically. If the tarfile is "-", then it will be
output to standard output (stdout) so that minitar may be piped.

The files or directories that will be packed into the tarfile are
specified after the name of the tarfile itself. Directories will be
processed recursively. If the token "--" is found in the list of files
to be packed, additional filenames will be read from standard input
(stdin). If any file is not found, the packaging will be halted.

create Options:
    --compress, -z  Compresses the tarfile with gzip.

  EOH

  include CatchMinitarErrors

  def run(args, opts = {})
    argv = []

    while (arg = args.shift)
      case arg
      when '--compress', '-z'
        opts[:compress] = true
      else
        argv << arg
      end
    end

    if argv.size < 2
      ioe[:output] << "Not enough arguments.\n\n"
      commander.command('help').call(%w(create))
      return 255
    end

    output = argv.shift
    if '-' == output
      opts[:name] = 'STDOUT'
      output = ioe[:output]
      opts[:output] = ioe[:error]
    else
      opts[:name] = output
      output = File.open(output, 'wb')
      opts[:output] = ioe[:output]
    end

    if opts[:name] =~ /\.tar\.gz$|\.tgz$/ or opts[:compress]
      require 'zlib'
      output = Zlib::GzipWriter.new(output)
    end

    files = []
    if argv.include?('--')
      # Read stdin for the list of files.
      files = ''
      files << ioe[:input].read until ioe[:input].eof?
      files = files.split(/\r\n|\n|\r/)
      args.delete('--')
    end

    files << argv.to_a
    files.flatten!

    watcher, finisher =
      if opts[:verbose]
        verbose
      elsif opts[:progress]
        progress
      else
        silent
      end

    Archive::Tar::Minitar.pack(files, output, &watcher)
    finisher.call
    0
  ensure
    output.close if output && !output.closed?
  end

  def help
    HELP
  end

  private

  def verbose
    [
      lambda { |action, name, _stats|
        opts[:output] << "#{name}\n" if action == :dir || action == :file_done
      },
      lambda { opts[:output] << "\n" }
    ]
  end

  def progress
    require 'powerbar'
    progress = PowerBar.new(:msg => opts[:name], :total => 1)
    [
      lambda { |action, name, stats|
        progress_info = {}

        case action
        when :file_start, :dir
          progress_info[:msg] = File.basename(name)

          if action == :dir
            progress_info[:total] = progress.total + 1
            progress_info[:done] = progress.done + 1
          else
            progress_info[:total] = progress.total + stats[:size]
          end
        when :file_progress
          progress_info[:done] = progress.done + stats[:currinc]
        end

        progress.show(progress_info)
      },
      lambda {
        progress.show(:msg => opts[:name])
        progress.close(true)
      }
    ]
  end

  def silent
    [ lambda { |_, _, _| }, lambda {} ]
  end
end
