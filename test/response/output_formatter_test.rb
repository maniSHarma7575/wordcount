require 'minitest/autorun'
require_relative '../../lib/word_counts/response/output_formatter'

class OutputFormatterTest < Minitest::Test
  def setup
    @file_path = ['test/fixtures/files/test.txt']
    @command_output = { 
      "total" => { 
        "file_exists" => true, 
        "L"=>78,
        "l"=>7147,
        "c"=>335086,
        "w"=>58171,
        "m"=>332190
      },
      "test/fixtures/files/test.txt" => { 
        "file_exists" => Pathname.new('test/fixtures/files/test.txt').realpath, 
        "L"=>78,
        "l"=>7146,
        "c"=>335043,
        "w"=>58164,
        "m"=>332147
      }
    }
  end

  def test_generate_output_string
    output_formatter = WordCounts::Response::OutputFormatter.new(@file_path, @command_output)
    formatted_output = output_formatter.format_output

    assert_equal "    335043    332147    58164    7146    78 test/fixtures/files/test.txt\n    335086    332190    58171    7147    78 total\n", formatted_output
  end
end