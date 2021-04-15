require 'minitest/autorun'
require './lib/bot.rb'
require './lib/princess.rb'
require './lib/navigator.rb'

class NavigatorTest< Minitest::Test
  def setup
    n = 3
    moves = ((n-1)/2)
    grid = ['--p', '-m-', '---']
    mario = Bot.new(moves, moves)
    peach = Princess.new(n, grid)
    @matrix = Navigator.new(n, grid, mario, peach)
  end

  def test_it_exists
    assert_instance_of Navigator, @matrix
  end

  def test_it_has_attributes
    assert_equal 3, @matrix.grid_size
    assert_equal ['--p', '-m-', '---'], @matrix.grid
    assert_equal 1, @matrix.bot_row
    assert_equal 1, @matrix.bot_column
    assert_equal 0, @matrix.princess_row
    assert_equal 2, @matrix.princess_column
    expected = "UP\nRIGHT"
    assert_equal expected, @matrix.vector
  end

  def test_it_can_find_required_moves
    assert_equal 1, @matrix.required_moves
  end

  def test_it_can_find_next_move
    expected = /UP\n/
    assert_output(expected) { @matrix.next_move }
  end

  def test_it_can_display_direction
    expected = /UP\nRIGHT\n/
    assert_output(expected) { @matrix.display_direction}
  end
end
