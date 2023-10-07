module WordCounts
  class Command
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def max_length_line
      File.foreach(file_path).map(&:size).max
    end

    def no_of_bytes
      File.foreach(file_path).map(&:bytesize).sum
    end

    def no_of_characters
      File.foreach(file_path).map(&:size).sum
    end

    def no_of_lines
      File.foreach(file_path).count
    end

    def no_of_words
      File.foreach(file_path).map(&:split)&.map(&:count)&.sum
    end
  end
end