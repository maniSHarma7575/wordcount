# frozen_string_literal: true

require_relative '../../word_count'

module WordCounts
  module Response
    class Output
      def self.generate_output_string(file_path, command_output)
        return file_missing_output(file_path) unless command_output['file_exists']

        options = Options::VALID_OPTIONS
        output_string = options.map { |option| "    #{command_output[option]}" }.join
        "#{output_string} #{file_path}\n"
      end

      def self.file_missing_output(file_path)
        "#{WordCount::COMMAND_NAME}: #{file_path}: open: No such file or directory\n"
      end
    end
  end
end
