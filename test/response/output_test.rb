require 'minitest/autorun'
require_relative '../../lib/word_counts/response/output'

class OutputTest < Minitest::Test
  def setup
    @file_path = 'test/fixtures/files/test.txt'
    @command_output = { 
      "file_exists" => Pathname.new('test/fixtures/files/test.txt').realpath, 
      "L"=>78,
      "l"=>7146,
      "c"=>335043,
      "w"=>58164,
      "m"=>332147
    }
  end

  def test_generate_output_string
    output_string = WordCounts::Response::Output.generate_output_string(@file_path, @command_output)
    assert_equal "    335043    332147    58164    7146    78 test/fixtures/files/test.txt\n", output_string
  end
end