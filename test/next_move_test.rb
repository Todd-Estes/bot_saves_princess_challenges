require 'minitest/autorun'
require './lib/next_move.rb'

class NextMoveTest < Minitest::Test
  def test_it_finds_princess_position
    n = 3
    grid = ['--p', '-m-', '---']
    expected = [[0], [2]]
    assert_equal expected, NextMove.find_princess_position(n, grid)
    refute_equal expected, NextMove.find_princess_position(3, ['---', '-m-', '-p-'])
  end
end
