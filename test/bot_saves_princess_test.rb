require 'minitest/autorun'
require './lib/bot_saves_princess.rb'

class BotSavesPrincessTest < Minitest::Test
  def test_finds_path_to_top_right_corner
    n = 3
    # Princess is in top-right corner
    grid = ['--p', '-m-', '---']
    expected = /UP\nRIGHT\n/
    assert_output(expected) { BotSavesPrincess.display_path_to_princess(n, grid)}
  end

  def test_finds_path_to_top_left_corner
    n = 3
    # Princess is in top-left corner
    grid = ['p--', '-m-', '---']
    expected = /UP\nLEFT\n/
    assert_output(expected) { BotSavesPrincess.display_path_to_princess(n, grid)}
  end

  def test_finds_path_to_bottom_right_corner
    n = 3
    # Princess is in bottom-right corner
    grid = ['---', '-m-', '--p']
    expected = /DOWN\nRIGHT\n/
    assert_output(expected) { BotSavesPrincess.display_path_to_princess(n, grid)}
  end

  def test_finds_path_to_bottom_left_corner
    n = 3
    # Princess is in bottom-left corner
    grid = ['---', '-m-', 'p--']
    expected = /DOWN\nLEFT\n/
    assert_output(expected) { BotSavesPrincess.display_path_to_princess(n, grid)}
  end

  def test_grid_size_input_with_number_over_100
    n = 101
    # n must be less than 100 n(<100)
    expected = /RE-ENTER INPUT PARAMETERS\n/
    assert_output(expected) { BotSavesPrincess.validate_size_input(n)}
  end

  def test_grid_size_input_with_number_below_3
    n = 1
    # n must be >= 3
    expected = /RE-ENTER INPUT PARAMETERS\n/
    assert_output(expected) { BotSavesPrincess.validate_size_input(n)}
  end

  def test_grid_size_input_with_even_number
    n = 6
    # n must be odd
    expected = /RE-ENTER INPUT PARAMETERS\n/
    assert_output(expected) { BotSavesPrincess.validate_size_input(n)}
  end
end
