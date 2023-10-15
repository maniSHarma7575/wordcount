# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/word_counts/commands/command_executor'

class CommandExecutorTest < Minitest::Test
  def setup
    @file_paths = ['test/fixtures/files/test.txt',  'test/fixtures/files/test1.txt']
    @absolute_paths = @file_paths.map { |file_path| Pathname.new(file_path).realpath }
    @options = %w[L l c w m]
  end

  def test_execute_command
    command_executor = WordCounts::Commands::CommandExecutor.new(
      options: @options,
      files_paths: @file_paths,
      absolute_paths: @absolute_paths
    )

    command_output = command_executor.execute_command
    expected_output = {
      'total' => {
        'L' => 78,
        'l' => 7147,
        'c' => 335086,
        'w' => 58171,
        'm' => 332190
      },
      'test/fixtures/files/test.txt' => {
        'file_exists' => Pathname.new('test/fixtures/files/test.txt').realpath,
        'L' => 78,
        'l' => 7146,
        'c' => 335043,
        'w' => 58164,
        'm' => 332147
      },
      'test/fixtures/files/test1.txt' => {
        'file_exists' => Pathname.new('test/fixtures/files/test1.txt').realpath,
        'L' => 43,
        'l' => 1,
        'c' => 43,
        'w' => 7,
        'm' => 43
      }
    }
    assert_equal expected_output, command_output
  end

  def test_execute_command_with_imaginary_files
    @absolute_paths[1] = nil
    command_executor = WordCounts::Commands::CommandExecutor.new(
      options: @options,
      files_paths: @file_paths,
      absolute_paths: @absolute_paths
    )

    command_output = command_executor.execute_command
    expected_output = {
      'total' => {
        'L' => 78,
        'l' => 7146,
        'c' => 335043,
        'w' => 58164,
        'm' => 332147
      },
      'test/fixtures/files/test.txt' => {
        'file_exists' => Pathname.new('test/fixtures/files/test.txt').realpath,
        'L' => 78,
        'l' => 7146,
        'c' => 335043,
        'w' => 58164,
        'm' => 332147
      }
    }

    assert_equal expected_output, command_output
  end
end
