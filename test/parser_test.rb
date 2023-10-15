# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/word_counts/parser'

class ParserTest < Minitest::Test
  def setup
    @arguments = ['-lwcmLk', 'test/fixtures/files/test.txt']
  end

  def test_raise_exception_for_illegal_options
    error = assert_raises StandardError do
      WordCounts::Parser.new(@arguments).parse_options
    end

    assert_equal "wordcount: illegal option -- k \n usage: wordcount [-Lclmw] [file ...]", error.message
  end

  def test_parse_options
    @arguments[0] = '-lwcmL'
    options = WordCounts::Parser.new(@arguments).parse_options
    assert_equal %w[L c l m w], options
  end

  def test_parse_file_paths
    @arguments.push('test/fixtures/files/test1.txt')
    files_paths = WordCounts::Parser.new(@arguments).parse_file_paths
    assert_equal @arguments[1..], files_paths
  end
end
