require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/game'

Dir.chdir(File.dirname(File.expand_path(__FILE__)))

golden_master_lines = File.read('golden_master.txt').split("\n")
game_output_lines   = `ruby dump_golden_master.rb`.split("\n")

lines_to_match = [golden_master_lines.size, game_output_lines.size].max

describe 'Golden Master' do
  lines_to_match.times do |line_no|
    it "line #{line_no} should match" do
      assert_equal golden_master_lines[line_no - 1], game_output_lines[line_no - 1]
    end
  end
end
