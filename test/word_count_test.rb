# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/word_count'

class WordCountTest < Minitest::Test
  def test_illegal_option_passed
    arguments = ['-lwcmLk', 'fixtures/files/test.txt']
    word_count = WordCount.new(arguments)
    out, _erro = capture_io do
      word_count.execute_command
    end

    assert_match(/wordcount: illegal option -- k/, out)

    arguments[0] = 'lwcmLk'
    word_count = WordCount.new(arguments)
    out, _erro = capture_io do
      word_count.execute_command
    end
    assert_match(/wordcount: lwcmLk: open: No such file or directory/, out)
  end

  def test_file_paths_passed_not_exists
    arguments = ['-lwcmL', 'imaginary.txt']

    word_count = WordCount.new(arguments)
    out, _errr = capture_io do
      word_count.execute_command
    end

    assert_match(/wordcount: imaginary.txt: open: No such file or directory/, out)
  end

  def test_file_paths_exists_with_legal_options
    arguments = ['-lcmwL', 'test/fixtures/files/test.txt', 'test/fixtures/files/test1.txt']

    word_count = WordCount.new(arguments)
    out, _errr = capture_io do
      word_count.execute_command
    end

    assert_equal("    335043    332147    58164    7146    78 test/fixtures/files/test.txt\n    43    43    7    1\
    43 test/fixtures/files/test1.txt\n    335086    332190    58171    7147    78 total\n", out)
  end
end
