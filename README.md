# minitar-cli

- home :: https://github.com/halostatue/minitar-cli
- code :: https://github.com/halostatue/minitar-cli
- issues :: https://github.com/halostatue/minitar-cli/issues

## Description

`minitar-cli` is a pure-Ruby command-line tool that uses [minitar][minitar] to
provide a command-line tool, `minitar`, for working with POSIX tar(1) archive
files.

## Synopsis

Using `minitar-cli` is easy; its functionality is provided through `bin/minitar`
(installed as `minitar`). It supports three basic commands: `create`, `extract`,
and `list`.

All `minitar` commands support two common options, `verbose` and `progress`.
These are mutually exclusive and `progress` has a higher priority than
`verbose`.

`verbose`:: `--verbose` (`-V`), puts the requested command in verbose mode.
`progress`:: `--progress` (`-P`), shows a progress bar (if appropriate) or puts
the requested command in verbose mode.

### `minitar create`

```sh
minitar create [OPTIONS] <tarfile|-> <file|directory|-->+
```

Creates a new tarfile. If the tarfile is named .tar.gz or .tgz, then it will be
compressed automatically. If the tarfile is "-", then it will be output to
standard output (stdout) so that minitar may be piped.

The files or directories that will be packed into the tarfile are specified
after the name of the tarfile itself. Directories will be processed recursively.
If the token "--" is found in the list of files to be packed, additional
filenames will be read from standard input (stdin). If any file is not found,
the packaging will be halted.

`create` also supports the `compress` option.

- `compress`: `--compress` (`-z`), compresses the tarfile with gzip.

### `minitar extract`

```sh
minitar extract [OPTIONS] <tarfile|-> [<file>+]
```

Extracts files from an existing tarfile. If the tarfile is named .tar.gz or
.tgz, then it will be uncompressed automatically. If the tarfile is "-", then it
will be read from standard input (stdin) so that minitar may be piped.

The files or directories that will be extracted from the tarfile are specified
after the name of the tarfile itself. Directories will be processed recursively.
Files must be specified in full. A file "foo/bar/baz.txt" cannot simply be
specified by specifying "baz.txt". Any file not found will simply be skipped and
an error will be reported.

`extract` also supports the `uncompress`, `pipe`, and `output` options.

- `uncompress`: `--uncompress` (`-z`), uncompresses the tarfile with gzip.
- `pipe`: `--pipe`, emits the extracted files to STDOUT for piping.
- `output`: `--output` (`-o`), extracts the files to the specified directory.

### `minitar list`

```sh
minitar list [OPTIONS] <tarfile|-> [<file>+]
```

Lists files in an existing tarfile. If the tarfile is named .tar.gz or .tgz,
then it will be uncompressed automatically. If the tarfile is "-", then it will
be read from standard input (stdin) so that minitar may be piped.

The files or directories to be filtered are specified after the name of the
tarfile itself.

Both `verbose` and `progress` act as a file detail view, similar to `ls -l`.

`list` also supports the `uncompress`, `sort`, `reverse`, and `l` options.

- `uncompress`: `--uncompress` `-z`, uncompresses the tarfile with gzip.
- `sort`:: `--sort` (`-S`), sorts the list of files by the specified field.
  Supported sort fields are `name` (the default), `mtime`, and `size`.
- `reverse`:: Reverses the sort.
- `l`:: Lists the files in detail (like `verbose`).

## minitar-cli Semantic Versioning

The minitar-cli tool uses a {Semantic Versioning}[http://semver.org/] scheme
with one change:

- When PATCH is zero (`0`), it will be omitted from version references.

[minitar]: https://github.com/halostatue/minitar
