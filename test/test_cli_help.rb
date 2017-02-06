# frozen_string_literal: true

require 'minitest_helper'

class TestCLIHelp < Minitest::Test
  def test_help_output_with_no_args
    assert_output Minitar::CLI::Command::Help::BASIC do
      assert_equal 0, cli
    end
  end

  def test_help_output_with_help
    assert_output Minitar::CLI::Command::Help::BASIC do
      assert_equal 0, cli('help')
    end
  end

  def test_help_output_with_bad_command
    assert_output Minitar::CLI::Command::Help::BASIC do
      assert_equal 0, cli('foo')
    end
  end

  def test_help_output_with_help_bad_command
    assert_output "Unknown command: foo\n#{Minitar::CLI::Command::Help::BASIC}" do
      assert_equal 0, cli('help', 'foo')
    end
  end

  def test_help_output_commands
    assert_output Minitar::CLI::Command::Help::COMMANDS do
      assert_equal 0, cli('help', 'commands')
    end
  end

  def test_help_output_create
    assert_output Minitar::CLI::Command::Create::HELP do
      assert_equal 0, cli('help', 'create')
    end
  end

  def test_help_output_create_minargs
    assert_output "Not enough arguments.\n\n#{Minitar::CLI::Command::Create::HELP}" do
      assert_equal 255, cli('create')
    end
  end

  def test_help_output_list
    assert_output Minitar::CLI::Command::List::HELP do
      assert_equal 0, cli('help', 'list')
    end
  end

  def test_help_output_list_minargs
    assert_output "Not enough arguments.\n\n#{Minitar::CLI::Command::List::HELP}" do
      assert_equal 255, cli('list')
    end
  end

  def test_help_output_extract
    assert_output Minitar::CLI::Command::Extract::HELP do
      assert_equal 0, cli('help', 'extract')
    end
  end

  def test_help_output_extract_minargs
    assert_output "Not enough arguments.\n\n#{Minitar::CLI::Command::Extract::HELP}" do
      assert_equal 255, cli('extract')
    end
  end
end
