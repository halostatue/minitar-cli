# frozen_string_literal: true

require "minitest_helper"

class TestCLIList < Minitest::Test
  def list_bad_dir(args = [])
    cli_list("bad-dir", args)
  end

  def list_spaces(args = [])
    cli_list("spaces", args)
  end

  def cli_list(name, args = [])
    args = %W[list test/fixtures/#{name}.tar.gz] + Array(args)
    cli(*args)
  end

  def test_list_output_bad_dir_fixture
    assert_cli_output "../qwerty\n" do
      assert_equal 0, list_bad_dir
    end
  end

  def test_list_output_spaces
    assert_cli_output [%r{\A\./$}, %r{^\./bin/minitar\n\z}] do
      assert_equal 0, list_spaces
    end
  end

  def test_list_output_spaces_verbose
    patterns = [
      %r{\Adrwxr-xr-x\s+0\s+austin\s+staff\s+0\s+Feb\s+0[67]\s+2017\s+\./$},
      %r{^-rwxr-xr-x\s+0\s+austin\s+staff\s+219\s+Feb\s+0[67]\s+2017\s+\./bin/minitar\n\z}
    ]
    assert_cli_output patterns do
      assert_equal 0, list_spaces("--verbose")
    end
  end

  def test_list_output_spaces_verbose_sort_size
    patterns = [
      %r{\Adrwxr-xr-x\s+0\s+austin\s+staff\s+0\s+Feb\s+0[67]\s+2017\s+\./$},
      %r{^-rw-r--r--\s+8\s+austin\s+staff\s+4296\s+Feb\s+0[67]\s+2017\s+./lib/minitar/cli/command/extract.rb\n\z}
    ]
    assert_cli_output patterns do
      assert_equal 0, list_spaces(%w[--verbose --sort size])
    end
  end

  def test_list_output_spaces_verbose_sort_size_reverse
    patterns = [
      %r{\A-rw-r--r--\s+8\s+austin\s+staff\s+4296\s+Feb\s+0[67]\s+2017\s+./lib/minitar/cli/command/extract.rb$},
      %r{^drwxr-xr-x\s+0\s+austin\s+staff\s+0\s+Feb\s+0[67]\s+2017\s+\./\n\z}
    ]

    assert_cli_output patterns do
      assert_equal 0, list_spaces(%w[--verbose --sort size --reverse])
    end
  end

  def test_list_output_spaces_verbose_sort_name
    patterns = [
      %r{\Adrwxr-xr-x\s+0\s+austin\s+staff\s+0\s+Feb\s+0[67]\s+2017\s+\./$},
      %r{^-rw-r--r--\s+7\s+austin\s+staff\s+3974\s+Feb\s+0[67]\s+2017\s+./minitar-cli.gemspec\n\z}
    ]
    assert_cli_output patterns do
      assert_equal 0, list_spaces(%w[--verbose --sort name])
    end
  end

  def test_list_output_spaces_verbose_sort_name_reverse
    patterns = [
      %r{\A-rw-r--r--\s+7\s+austin\s+staff\s+3974\s+Feb\s+0[67]\s+2017\s+./minitar-cli.gemspec$},
      %r{^drwxr-xr-x\s+0\s+austin\s+staff\s+0\s+Feb\s+0[67]\s+2017\s+\./\n\z}
    ]

    assert_cli_output patterns do
      assert_equal 0, list_spaces(%w[--verbose --sort name --reverse])
    end
  end

  def test_list_output_spaces_verbose_sort_mtime
    patterns = [
      %r{\Adrwxr-xr-x\s+0\s+austin\s+staff\s+0\s+Nov\s+0[23]\s+2016\s+\./docs/$},
      %r{^-rw-r--r--\s+2\s+austin\s+staff\s+1319\s+Feb\s+0[67]\s+2017\s+./.pullreview.yml\n\z}
    ]
    assert_cli_output patterns do
      assert_equal 0, list_spaces(%w[--verbose --sort mtime])
    end
  end

  def test_list_output_spaces_verbose_sort_mtime_reverse
    patterns = [
      %r{\A-rw-r--r--\s+2\s+austin\s+staff\s+1319\s+Feb\s+0[67]\s+2017\s+./.pullreview.yml$},
      %r{^drwxr-xr-x\s+0\s+austin\s+staff\s+0\s+Nov\s+0[23]\s+2016\s+\./docs/\n\z}
    ]

    assert_cli_output patterns do
      assert_equal 0, list_spaces(%w[--verbose --sort mtime --reverse])
    end
  end

  def test_list_stdin
    assert_cli_output "../qwerty\n" do
      File.open("test/fixtures/bad-dir.tar.gz") do |f|
        assert_equal 0, Minitar::CLI.run(%w[list - --uncompress], f)
      end
    end
  end

  def test_list_output_spaces_filtered
    assert_cli_output "./bin/minitar\n" do
      assert_equal 0, list_spaces("./bin/minitar")
    end
  end

  def test_list_output_spaces_filtered_verbose
    expected =
      %r{\A-rwxr-xr-x\s+0\s+austin\s+staff\s+219\s+Feb\s+0[67]\s+2017\s+./bin/minitar\n\z}
    assert_cli_output expected do
      assert_equal 0, list_spaces(["./bin/minitar", "--verbose"])
    end
  end
end
