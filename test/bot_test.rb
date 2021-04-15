require 'minitest/autorun'
require './lib/bot.rb'

class BotTest< Minitest::Test
  def test_it_exists
    n = 3
    grid = ['--p', '-m-', '---']
    mario = Bot.new(n, grid)
    assert_instance_of Bot, mario
  end

  def test_it_has_attributes
    n = 3
    mario = Bot.new(n, n)
    assert_equal 3, mario.row
    assert_equal 3, mario.column
  end
end
