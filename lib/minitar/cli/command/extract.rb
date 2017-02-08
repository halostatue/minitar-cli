# frozen_string_literal: true

# Tarball extraction command. This will be replaced in a future version by one
# of the better-executed CLI application frameworks like GLI, after Ruby 1.8
# and 1.9 support have been dropped.
class Minitar::CLI::Command::Extract < Minitar::CLI::Command
  def name
    'extract'
  end

  def altname
    'ex'
  end

  HELP = <<-EOH.freeze
    minitar extract [OPTIONS] <tarfile|-> [<file>+]

Extracts files from an existing tarfile. If the tarfile is named .tar.gz
or .tgz, then it will be uncompressed automatically. If the tarfile is
"-", then it will be read from standard input (stdin) so that minitar
may be piped.

The files or directories that will be extracted from the tarfile are
specified after the name of the tarfile itself. Directories will be
processed recursively. Files must be specified in full. A file
"foo/bar/baz.txt" cannot simply be specified by specifying "baz.txt".
Any file not found will simply be skipped and an error will be reported.

extract Options:
    --uncompress, -z  Uncompresses the tarfile with gzip.
    --pipe            Emits the extracted files to STDOUT for piping.
    --output, -o      Extracts the files to the specified directory.

  EOH

  include CatchMinitarErrors

  def run(args, opts = {})
    argv    = []
    output  = nil
    dest    = '.'
    files   = []

    while (arg = args.shift)
      case arg
      when '--uncompress', '-z'
        opts[:uncompress] = true
      when '--pipe'
        output = ioe[:output]
        ioe[:output] = ioe[:error]
      when '--output', '-o'
        dest = args.shift
      else
        argv << arg
      end
    end

    if argv.empty?
      ioe[:output] << "Not enough arguments.\n\n"
      commander.command('help').call(%w(extract))
      return 255
    end

    input = argv.shift
    if '-' == input
      opts[:name] = 'STDIN'
      input = ioe[:input]
    else
      opts[:name] = input
      input = File.open(input, 'rb')
    end

    if opts[:name] =~ /\.tar\.gz$|\.tgz$/ or opts[:uncompress]
      require 'zlib'
      input = Zlib::GzipReader.new(input)
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

    if output.nil?
      Archive::Tar::Minitar.unpack(input, dest, files, &watcher)
      finisher.call
    else
      Archive::Tar::Minitar::Input.each_entry(input) do |entry|
        next unless files.empty? || files.include?(entry.full_name)

        stats = {
          :mode     => entry.mode,
          :mtime    => entry.mtime,
          :size     => entry.size,
          :gid      => entry.gid,
          :uid      => entry.uid,
          :current  => 0,
          :currinc  => 0,
          :entry    => entry
        }

        if entry.directory?
          watcher.call(:dir, dest, stats)
        else
          watcher.call(:file_start, destfile, stats)
          loop do
            data = entry.read(4096)
            break unless data
            stats[:currinc] = output.write(data)
            stats[:current] += stats[:currinc]

            watcher.call(:file_progress, name, stats)
          end
          watcher.call(:file_done, name, stats)
        end
      end
    end

    0
  end

  def help
    HELP
  end

  private

  def verbose
    [
      lambda { |action, name, _stats|
        ioe[:output] << "#{name}\n" if action == :dir or action == :file_done
      },
      lambda { ioe[:output] << "\n" }
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
            progress_info[:total] = progress.total + stats[:entry].size
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
