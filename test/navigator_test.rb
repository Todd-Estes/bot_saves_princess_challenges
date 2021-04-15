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

  def test_it_can_find_next_move_up
    expected = /UP\n/
    assert_output(expected) { @matrix.next_move }
  end

  def test_it_can_find_next_move_right
    n = 3
    r = 0
    c = 0
    grid = ['m-p', '---', '---']
    mario = Bot.new(r, c)
    peach = Princess.new(n, grid)
    matrix = Navigator.new(n, grid, mario, peach)
    expected = /RIGHT\n/
    assert_output(expected) { matrix.next_move }
  end

  def test_it_can_find_next_move_left
    n = 3
    r = 1
    c = 2
    grid = ['---', 'p-m', '---']
    mario = Bot.new(r, c)
    peach = Princess.new(n, grid)
    matrix = Navigator.new(n, grid, mario, peach)
    expected = /LEFT\n/
    assert_output(expected) { matrix.next_move }
  end

  def test_it_can_find_next_move_down
    n = 3
    r = 1
    c = 2
    grid = ['---', '--m', '--p']
    mario = Bot.new(r, c)
    peach = Princess.new(n, grid)
    matrix = Navigator.new(n, grid, mario, peach)
    expected = /DOWN\n/
    assert_output(expected) { matrix.next_move }
  end

  def test_it_can_display_direction_to_top_right_corner
    expected = /UP\nRIGHT\n/
    assert_output(expected) { @matrix.display_direction }
  end

  def test_it_can_display_direction_to_top_left_corner
    n = 3
    moves = ((n-1)/2)
    grid = ['p--', '-m-', '---']
    mario = Bot.new(moves, moves)
    peach = Princess.new(n, grid)
    matrix = Navigator.new(n, grid, mario, peach)
    expected = /UP\nLEFT\n/
    assert_output(expected) { matrix.display_direction }
  end

  def test_it_can_display_direction_to_bottom_left_corner
    n = 3
    moves = ((n-1)/2)
    grid = ['---', '-m-', 'p--']
    mario = Bot.new(moves, moves)
    peach = Princess.new(n, grid)
    matrix = Navigator.new(n, grid, mario, peach)
    expected = /DOWN\nLEFT\n/
    assert_output(expected) { matrix.display_direction }
  end

  def test_it_can_display_direction_to_bottom_right_corner
    n = 3
    moves = ((n-1)/2)
    grid = ['---', '-m-', '--p']
    mario = Bot.new(moves, moves)
    peach = Princess.new(n, grid)
    matrix = Navigator.new(n, grid, mario, peach)
    expected = /DOWN\nRIGHT\n/
    assert_output(expected) { matrix.display_direction }
  end
end
