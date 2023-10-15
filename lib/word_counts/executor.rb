# frozen_string_literal: true

require_relative 'file_handler'
require_relative 'commands/command_executor'
require_relative 'response/output_formatter'

module WordCounts
  class Executor
    attr_reader :options, :files_path

    def initialize(options:, files_path:)
      @options = options
      @files_path = files_path
    end

    def run_command
      file_handler = FileHandler.new(files_path)
      absolute_paths = file_handler.absolute_paths

      command_executor = Commands::CommandExecutor.new(
        options: options,
        absolute_paths: absolute_paths,
        files_paths: files_path
      )
      command_output = command_executor.execute_command

      output_formatter = Response::OutputFormatter.new(files_path, command_output)
      output_formatter.format_output
    end
  end
end
