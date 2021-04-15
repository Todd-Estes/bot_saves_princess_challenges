require 'minitest/autorun'
require './lib/princess.rb'

class PrincessTest< Minitest::Test
  def test_it_exists
    n = 3
    grid = ['--p', '-m-', '---']
    peach = Princess.new(n, grid)
    assert_instance_of Princess, peach
  end

  def test_it_has_attributes
    n = 3
    grid = ['--p', '-m-', '---']
    peach = Princess.new(n, grid)
    assert_equal 3, peach.grid_size
    assert_equal grid, peach.grid
    assert_equal 0, peach.row
    assert_equal 2, peach.column
  end

  def test_it_can_find_princess_position
    n = 3
    grid = ['--p', '-m-', '---']
    peach = Princess.new(n, grid)
    expected = [0, 2]
    assert_equal expected, peach.find_princess_position
  end
end
