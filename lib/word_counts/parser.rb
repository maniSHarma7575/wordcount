require_relative 'options'
require 'pry'

module WordCounts
  class Parser
    attr_reader :arguments

    def initialize(arguments)
      @arguments = arguments
    end

    def parse_options
      options = []
      arguments.each do |argument|
        next unless argument.start_with?('-')

        options_chars = argument[1..].split('').sort
        invalid_chars = Options.filter_invalid_options(options_chars)
        
        if invalid_chars.empty?
          options.concat(options_chars)
        else
          invalid_option = invalid_chars[0]
          raise "#{WordCount::COMMAND_NAME}: illegal option -- #{invalid_option} \n usage: #{WordCount::COMMAND_NAME} [-Lclmw] [file ...]"
          exit(1)
        end
      end
      options.uniq
    end

    def parse_file_paths
      arguments.reject { |argument| argument.start_with?('-') }
    end
  end
end