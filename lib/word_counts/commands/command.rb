# frozen_string_literal: true

module WordCounts
  module Commands
    class Command
      attr_reader :lines

      def initialize(file_path)
        @lines = File.foreach(file_path)
      end

      def max_length_line
        lines.map(&:strip).map(&:size).max
      end

      def no_of_bytes
        lines.map(&:bytesize).sum
      end

      def no_of_characters
        lines.map(&:size).sum
      end

      def no_of_lines
        lines.count
      end

      def no_of_words
        lines.map(&:split)&.map(&:count)&.sum
      end
    end
  end
end
