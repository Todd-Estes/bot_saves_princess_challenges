require 'minitest/autorun'
require './lib/bot_saves_princess_two.rb'

class BotSavesPrincessTwoTest < Minitest::Test
  def test_find_princess_position
    n = 3
    grid = ['--p', '-m-', '---']
    expected = [[0], [2]]
    assert_equal expected, BotSavesPrincessTwo.find_princess_position(n, grid)
    refute_equal expected, BotSavesPrincessTwo.find_princess_position(3, ['---', '-m-', '-p-'])
  end

  def test_next_move_is_right
    n = 3
    r = 0
    c = 0
    # As seen in first test, princess' column position will be 2;
    # the bot's position column position will be 1
    grid = ['m-p', '---', '---']
    expected = /RIGHT\n/
    assert_output(expected) { BotSavesPrincessTwo.next_move(n, r, c, grid)}
  end

  def test_next_move_is_left
    n = 3
    r = 1
    c = 2
    # Princess' column postion will be 0; bot's will be 2
    grid = ['---', 'p-m', '---']
    expected = /LEFT\n/
    assert_output(expected) { BotSavesPrincessTwo.next_move(n, r, c, grid)}
  end

  def test_next_move_is_up
    n = 3
    r = 2
    c = 2
    # Princess' row position will be 0; bot's will be 2
    grid = ['--p', '---', '--m']
    expected = /UP\n/
    assert_output(expected) { BotSavesPrincessTwo.next_move(n, r, c, grid)}
  end

  def test_next_move_is_down
    n = 3
    r = 1
    c = 2
    # Princess' row position will be 2; bot's will be 1
    grid = ['---', '--m', '--p']
    expected = /DOWN\n/
    assert_output(expected) { BotSavesPrincessTwo.next_move(n, r, c, grid)}
  end

  def test_grid_size_input_with_number_over_100
    n = 101
    # n must be less than 100 n(<100)
    expected = /RE-ENTER INPUT PARAMETERS\n/
    assert_output(expected) { BotSavesPrincessTwo.validate_size_input(n)}
  end

  def test_grid_size_input_with_number_below_3
    n = 1
    # n must be >= 3
    expected = /RE-ENTER INPUT PARAMETERS\n/
    assert_output(expected) { BotSavesPrincessTwo.validate_size_input(n)}
  end

  def test_grid_size_input_with_even_number
    n = 6
    # n must be odd
    expected = /RE-ENTER INPUT PARAMETERS\n/
    assert_output(expected) { BotSavesPrincessTwo.validate_size_input(n)}
  end
end
