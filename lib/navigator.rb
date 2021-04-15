require './lib/bot'
require './lib/princess'

class Navigator
  attr_reader :grid_size, :grid, :bot_row, :bot_column, :princess_row, :princess_column, :vector
  def initialize(n, grid, bot, princess)
    @grid_size = n
    @grid = grid
    @bot_row = bot.row
    @bot_column = bot.column
    @princess_row = princess.row
    @princess_column = princess.column
    @vector = direction
  end

  def required_moves
    ((@grid_size-1)/2)
  end

  def next_move
     if @bot_row != @princess_row
       if @bot_row < @princess_row
         puts 'DOWN'
       else
         puts 'UP'
       end
     elsif @bot_column < @princess_column
       puts 'RIGHT'
     else
       puts 'LEFT'
     end
   end

  def direction
    if @grid[0][0] == 'p'
     "UP\nLEFT"
   elsif @grid[0][-1] == 'p'
     "UP\nRIGHT"
   elsif @grid[-1][0] == 'p'
     "DOWN\nLEFT"
    else
     "DOWN\nRIGHT"
    end
  end

  def display_direction
   required_moves.times do
     puts @vector
   end
 end
end
