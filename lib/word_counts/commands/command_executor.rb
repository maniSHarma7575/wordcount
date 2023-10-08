require_relative 'command'
require_relative '../options'

module WordCounts
  module Commands
    class CommandExecutor
      attr_reader :options, :absolute_paths, :files_paths

      def initialize(options:, absolute_paths:, files_paths:)
        @options = options
        @absolute_paths = absolute_paths
        @files_paths = files_paths
      end


      def execute_command
        command_output = initialize_command_output_hash
      
        absolute_paths.each_with_index do |path, index|
          if path
            command = Command.new(path)
            options.each do |option|
              result = command.send(task_to_execute(option))
              update_command_output(command_output, index, path, option, result)
            end
          else
            update_command_output(command_output, index, path)
          end
        end
        command_output
      end

      private

      def initialize_command_output_hash
        command_output = Hash.new { |h, k| h[k] = {} }
        command_output['total'] = Hash.new(0)
        command_output
      end
      
      def update_command_output(command_output, index, path, option = nil, result = nil)
        file_path = files_paths[index]
        command_output[file_path]['file_exists'] = path if path
        return unless option
      
        command_output[file_path][option] = result || 0

        if option == Options::MAX_LENGTH_LINE
          command_output['total'][option] = result if [command_output['total'][option], result || 0].max
        else
          command_output['total'][option] += result || 0
        end
      end

      def task_to_execute(option)
        case option
        when Options::MAX_LENGTH_LINE
          :max_length_line
        when Options::NO_OF_LINES
          :no_of_lines
        when Options::NO_OF_CHARACTERS
          :no_of_characters
        when Options::NO_OF_BYTES
          :no_of_bytes
        when Options::NO_OF_WORDS
          :no_of_words
        end
      end
    end
  end
end