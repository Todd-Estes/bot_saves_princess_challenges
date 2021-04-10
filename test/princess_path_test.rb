require 'minitest/autorun'
require './lib/princess_path.rb'

class PrincessPathTest < Minitest::Test
  def setup
    @princess_path = PrincessPath.new
  end

  def test_it_exists
    assert_instance_of PrincessPath, @princess_path
  end

  def test_finds_path
    n = 3
    grid = ['--p', '-m-', '---']
    expected = /UP\nRIGHT\n/
    assert_output(expected) { @princess_path.display_path_to_princess(n, grid)}
  end
end
