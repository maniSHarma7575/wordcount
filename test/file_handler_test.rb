# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/word_counts/file_handler'

class FileHandlerTest < Minitest::Test
  def setup
    @files_paths = ['test/fixtures/files/test.txt', 'test/fixtures/files/test1.txt']
  end

  def test_absolute_paths
    absolute_paths = WordCounts::FileHandler.new(@files_paths).absolute_paths
    assert_equal @files_paths.map { |file_path| Pathname.new("#{Dir.pwd}/#{file_path}") }, absolute_paths
  end

  def test_absolute_paths_for_imaginary_file
    absolute_paths = WordCounts::FileHandler.new(['imaginary.txt']).absolute_paths
    assert_equal [nil], absolute_paths
  end
end
