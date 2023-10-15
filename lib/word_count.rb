# frozen_string_literal: true

require_relative 'word_counts/parser'
require_relative 'word_counts/executor'
require_relative 'word_counts/options'

class WordCount
  attr_reader :arguments

  COMMAND_NAME = 'wordcount'

  def initialize(arguments)
    @arguments = arguments
  end

  def execute_command
    parser = WordCounts::Parser.new(arguments)
    options = parser.parse_options
    options = WordCounts::Options.default_options if options.empty?
    files_path = parser.parse_file_paths

    executor = WordCounts::Executor.new(options: options, files_path: files_path)
    print executor.run_command
  rescue StandardError => e
    print e.message
  end
end
