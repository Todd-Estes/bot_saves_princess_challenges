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
end
