module WordCounts
  class Parser
    attr_reader :arguments

    VALID_OTPIONS = %w[L l c m w]

    def initialize(arguments)
      @arguments = arguments
    end

    def parse_options
      options = []
      arguments.each do |argument|
        next unless argument.start_with?('-')

        options_chars = argument[1..].split('').sort
        invalid_chars = options_chars - VALID_OTPIONS
        
        if invalid_chars.empty?
          options.concat(options_chars)
        else
          invalid_option = invalid_chars[0]
          raise "wordcount: illegal option -- #{invalid_option} \n usage: wordcount [-Lclmw] [file ...]"
          exit(1)
        end
      end
      options.uniq
    end

    def parse_file_paths
      arguments.select { |argument| !argument.start_with?('-') }
    end
  end
end