# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/word_counts/options'

class OptionsTest < Minitest::Test
  def test_filter_invalid_options
    invalid_options = WordCounts::Options.filter_invalid_options(%w[l c w m L k])
    assert_equal invalid_options, %w[k]
  end

  def test_default_options
    assert_equal %w[c l w], WordCounts::Options.default_options
  end
end
