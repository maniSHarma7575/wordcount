require 'minitest/autorun'
require_relative '../../lib/word_counts/commands/command'

class CommandTest < Minitest::Test
  def setup
    @file_path = Pathname.new('test/fixtures/files/test.txt').realpath
    @command = WordCounts::Commands::Command.new(@file_path)
  end

  def test_max_length_line
    assert_equal @command.max_length_line, 78
  end

  def test_no_of_bytes
    assert_equal @command.no_of_bytes, 335043
  end

  def test_no_of_characters
    assert_equal @command.no_of_characters, 332147
  end

  def test_no_lines
    assert_equal @command.no_of_lines, 7146
  end

  def test_no_of_words
    assert_equal @command.no_of_words, 58164
  end
end