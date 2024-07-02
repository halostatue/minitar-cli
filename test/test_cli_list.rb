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
    assert_output "../qwerty\n" do
      assert_equal 0, list_bad_dir
    end
  end

  def test_list_output_spaces
    assert_cli_output %r{\Afirst-added$}, %r{^last-added\n\z} do
      assert_equal 0, list_spaces
    end
  end

  def test_list_output_spaces_verbose
    first = %r{\A-rw-r--r--\s+0\s+austin\s+staff\s+2\s+Feb\s+15\s+2007\s+first-added$}
    last = %r{^-rw-r--r--\s+0\s+austin\s+staff\s+3\s+Feb\s+15\s+2008\s+last-added\n\z}
    assert_cli_output first, last do
      assert_equal 0, list_spaces("--verbose")
    end
  end

  def test_list_output_spaces_verbose_sort_size
    first = %r{\A-rw-r--r--\s+0\s+austin\s+staff\s+0\s+Feb\s+15\s+2005\s+000-bytes$}
    last = %r{^-rw-r--r--\s+0\s+austin\s+staff\s+16\s+Feb\s+15\s+2006\s+largest\n\z}

    assert_cli_output first, last do
      assert_equal 0, list_spaces(%w[--verbose --sort size])
    end
  end

  def test_list_output_spaces_verbose_sort_size_reverse
    first = %r{\A-rw-r--r--\s+0\s+austin\s+staff\s+16\s+Feb\s+15\s+2006\s+largest$}
    last = %r{^-rw-r--r--\s+0\s+austin\s+staff\s+0\s+Feb\s+15\s+2005\s+000-bytes\n\z}
    assert_cli_output first, last do
      assert_equal 0, list_spaces(%w[--verbose --sort size --reverse])
    end
  end

  def test_list_output_spaces_verbose_sort_name
    first = %r{\A-rw-r--r--\s+0\s+austin\s+staff\s+4\s+Feb\s+15\s+2009\s+00-name$}
    last = %r{^-rw-r--r--\s+0\s+austin\s+staff\s+5\s+Feb\s+15\s+2010\s+zz-name\n\z}
    assert_cli_output first, last do
      assert_equal 0, list_spaces(%w[--verbose --sort name])
    end
  end

  def test_list_output_spaces_verbose_sort_name_reverse
    first = %r{\A-rw-r--r--\s+0\s+austin\s+staff\s+5\s+Feb\s+15\s+2010\s+zz-name$}
    last = %r{^-rw-r--r--\s+0\s+austin\s+staff\s+4\s+Feb\s+15\s+2009\s+00-name\n\z}
    assert_cli_output first, last do
      assert_equal 0, list_spaces(%w[--verbose --sort name --reverse])
    end
  end

  def test_list_output_spaces_verbose_sort_mtime
    first = %r{\A-rw-r--r--\s+0\s+austin\s+staff\s+6\s+Feb\s+15\s+2004\s+earliest$}
    last = %r{^-rw-r--r--\s+0\s+austin\s+staff\s+7\s+Feb\s+15\s+2014\s+latest\n\z}
    assert_cli_output first, last do
      assert_equal 0, list_spaces(%w[--verbose --sort mtime])
    end
  end

  def test_list_output_spaces_verbose_sort_mtime_reverse
    first = %r{\A-rw-r--r--\s+0\s+austin\s+staff\s+7\s+Feb\s+15\s+2014\s+latest$}
    last = %r{^-rw-r--r--\s+0\s+austin\s+staff\s+6\s+Feb\s+15\s+2004\s+earliest\n\z}
    assert_cli_output first, last do
      assert_equal 0, list_spaces(%w[--verbose --sort mtime --reverse])
    end
  end

  def test_list_stdin
    assert_output "../qwerty\n" do
      File.open("test/fixtures/bad-dir.tar.gz") do |f|
        assert_equal 0, Minitar::CLI.run(%w[list - --uncompress], f)
      end
    end
  end

  def test_list_output_spaces_filtered
    assert_output "zz-name\n" do
      assert_equal 0, list_spaces("zz-name")
    end
  end

  def test_list_output_spaces_filtered_verbose
    pattern = %r{\A-rw-r--r--\s+0\s+austin\s+staff\s+5\s+Feb\s+15\s+2010\s+zz-name\n\z}
    assert_output pattern do
      assert_equal 0, list_spaces(["zz-name", "--verbose"])
    end
  end
end
