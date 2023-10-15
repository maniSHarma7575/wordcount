require 'minitest/autorun'
require_relative '../lib/word_counts/executor'

class ExecutorTest < Minitest::Test
  def setup
    @options = %w[l c w m L]
    @files_paths = ['test/fixtures/files/test.txt', 'test/fixtures/files/test1.txt']
  end

  def test_run_command_for_imaginary_files
    output = WordCounts::Executor.new(options: @options, files_path: ['imaginary.txt']).run_command
    assert_equal "wordcount: imaginary.txt: open: No such file or directory\n    0    0    0    0    0 total\n", output
  end

  def test_run_command_for_existing_files
    output = WordCounts::Executor.new(options: @options, files_path: @files_paths).run_command
    assert_equal "    335043    332147    58164    7146    78 test/fixtures/files/test.txt\n    43    43    7    1    43 test/fixtures/files/test1.txt\n    335086    332190    58171    7147    78 total\n", output
  end
end