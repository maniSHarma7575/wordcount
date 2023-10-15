# frozen_string_literal: true

require_relative 'output'

module WordCounts
  module Response
    class OutputFormatter
      attr_reader :files_path, :command_output

      def initialize(files_path, command_output)
        @files_path = files_path
        @command_output = command_output
      end

      def format_output
        (files_path + ['total']).map do |file_path|
          Output.generate_output_string(file_path, command_output[file_path])
        end.join
      end
    end
  end
end
