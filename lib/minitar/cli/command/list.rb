# frozen_string_literal: true

# Tarball list command. This will be replaced in a future version by one of the
# better-executed CLI application frameworks like GLI, after Ruby 1.8 and 1.9
# support have been dropped.
class Minitar::CLI::Command::List < Minitar::CLI::Command
  def name
    'list'
  end

  def altname
    'ls'
  end

  HELP = <<-EOH.freeze
    minitar list [OPTIONS] <tarfile|-> [<file>+]

Lists files in an existing tarfile. If the tarfile is named .tar.gz or
.tgz, then it will be uncompressed automatically. If the tarfile is "-",
then it will be read from standard input (stdin) so that minitar may be
piped.

If --verbose or --progress is specified, then the file list will be
similar to that produced by the Unix command "ls -l".

list Options:
    --uncompress, -z      Uncompresses the tarfile with gzip.
    --sort [<FIELD>], -S  Sorts the list of files by the specified
                          field. The sort defaults to the filename.
    --reverse, -R         Reverses the sort.
    -l                    Lists the files in detail.

Sort Fields:
  name, mtime, size

  EOH

  def modestr(mode)
    s = String.new('---')
    s[0] = 'r' if (mode & 4) == 4
    s[1] = 'w' if (mode & 2) == 2
    s[2] = 'x' if (mode & 1) == 1
    s
  end

  include CatchMinitarErrors

  def run(args, opts = {})
    argv    = []
    output  = nil
    files   = []
    opts[:field] = 'name'

    while (arg = args.shift)
      case arg
      when '--sort', '-S'
        opts[:sort]   = true
        opts[:field]  = args.shift
      when '--reverse', '-R'
        opts[:reverse] = true
        opts[:sort]    = true
      when '--uncompress', '-z'
        opts[:uncompress] = true
      when '-l'
        opts[:verbose] = true
      else
        argv << arg
      end
    end

    if argv.empty?
      ioe[:output] << "Not enough arguments.\n\n"
      commander.command('help').call(%w(list))
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

    if opts[:verbose] or opts[:progress]
      format  = '%10s %4d %8s %8s %8d %12s %s'
      datefmt = '%b %d  %Y'
      timefmt = '%b %d %H:%M'
      fields  = %w(permissions inodes user group size date fullname)
    else
      format  = '%s'
      fields  = %w(fullname)
    end

    opts[:field] = opts[:field].to_sym
    opts[:field] = :full_name if opts[:field] == :name

    output = []

    today = Time.now
    oneyear = Time.mktime(today.year - 1, today.month, today.day)

    Archive::Tar::Minitar::Input.each_entry(input) do |entry|
      next unless files.empty? || files.include?(entry.full_name)

      value = format % fields.map { |ff|
        case ff
        when 'permissions'
          s = String.new(entry.directory? ? 'd' : '-')
          s << modestr(entry.mode / 0o100)
          s << modestr(entry.mode / 0o010)
          s << modestr(entry.mode)
        when 'inodes'
          entry.size / 512
        when 'user'
          entry.uname || entry.uid || 0
        when 'group'
          entry.gname || entry.gid || 0
        when 'size'
          entry.size
        when 'date'
          if Time.at(entry.mtime) > oneyear
            Time.at(entry.mtime).strftime(timefmt)
          else
            Time.at(entry.mtime).strftime(datefmt)
          end
        when 'fullname'
          entry.full_name
        end
      }

      if opts[:sort]
        output << [ entry.send(opts[:field]), value ]
      else
        ioe[:output] << value << "\n"
      end
    end

    if opts[:sort]
      output = output.sort { |a, b| a[0] <=> b[0] }
      if opts[:reverse]
        output.reverse_each { |oo| ioe[:output] << oo[1] << "\n" }
      else
        output.each { |oo| ioe[:output] << oo[1] << "\n" }
      end
    end

    0
  end

  def help
    HELP
  end
end
