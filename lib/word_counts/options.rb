# frozen_string_literal: true

module WordCounts
  class Options
    NO_OF_BYTES = 'c'
    NO_OF_CHARACTERS = 'm'
    NO_OF_WORDS = 'w'
    NO_OF_LINES = 'l'
    MAX_LENGTH_LINE = 'L'

    VALID_OPTIONS = [NO_OF_BYTES, NO_OF_CHARACTERS, NO_OF_WORDS, NO_OF_LINES, MAX_LENGTH_LINE].freeze

    def self.filter_invalid_options(options)
      options - VALID_OPTIONS
    end

    def self.default_options
      [NO_OF_BYTES, NO_OF_LINES, NO_OF_WORDS]
    end
  end
end
