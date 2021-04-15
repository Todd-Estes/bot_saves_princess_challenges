# Bot Saves Princess Challenges

The following code blocks will satisfy each of the two required HackerRank Bot Saves Princess challenges. Copy the code from each block and paste it within its respective code buffers to check its functionality.
_________________________________________________________________________________________________________________________________
**Bot Saves Princess 1** <br />
The changes that I made to the original Bot Saves Princess 1 challenge basically remove the BotSavesPrincess class and treat the displayPathtoPrincess method just as a "runner" file. I felt that by creating separate Bot and Princess classes I gave more modularity to the code that would make future additions easier. One could instantiate multiple princesses with minimal additional methods or logic, and multiple bots could also be created in the future using its own _find_princess_position_-like method, without the row and column of the bot being given.

The Navigator class is responsible for handling the logic which provides the directional-based output solutions for the challenges.
```
class Bot
  attr_reader :row, :column
  def initialize(row, column)
    @row = row
    @column = column
  end
end

class Princess
  attr_reader :row, :column
  def initialize(n, grid)
    @grid_size = n
    @grid = grid
    @row = find_princess_position[0]
    @column = find_princess_position[1]
  end

  def find_princess_position
    coordinates = []
      (0...@grid_size).each do |i|
         @grid[i].split('').each_with_index do |char, index|
           if char == 'p'
             coordinates << i
             coordinates << index
           end
         end
      end
    return coordinates
  end
end

class Navigator
  attr_reader :required_moves, :grid, :bot_row, :bot_column, :princess_row, :princess_column
  def initialize(n, grid, bot, princess)
    @required_moves = n
    @grid = grid
    @bot_row = bot.row
    @bot_column = bot.column
    @princess_row = princess.row
    @princess_column = princess.column
    @vector = direction
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
    @required_moves.times do
      puts @vector
    end
  end
end

class ValidateInput
  def self.check_size(n)
    if !n.odd? || n < 3 || n >= 100
      puts 'RE-ENTER INPUT PARAMETERS'
    end
  end
end 

def displayPathtoPrincess(n,grid)
  ValidateInput.check_size(n)
  moves = ((n - 1) / 2)
  mario = Bot.new(moves, moves)
  peach = Princess.new(n, grid)
  matrix = Navigator.new(moves, grid, mario, peach)
  matrix.display_direction
end

```
___________________________________________________________________________________________________________________________________
**Bot Saves Princess 2** <br />
These are the exact same classes used in the first Bot Saves Princess challenge, with a different method being used from the Navigator class to render the bot's first directional move. Again, I removed the BotSavesPrincessTwo class, with nextMove serving as a "runner" file.
```
class Bot
  attr_reader :row, :column
  def initialize(row, column)
    @row = row
    @column = column
  end
end

class Princess
  attr_reader :row, :column
  def initialize(n, grid)
    @grid_size = n
    @grid = grid
    @row = find_princess_position[0]
    @column = find_princess_position[1]
  end

  def find_princess_position
    coordinates = []
      (0...@grid_size).each do |i|
         @grid[i].split('').each_with_index do |char, index|
           if char == 'p'
             coordinates << i
             coordinates << index
           end
         end
      end
    return coordinates
  end
end

class Navigator
  attr_reader :required_moves, :grid, :bot_row, :bot_column, :princess_row, :princess_column
  def initialize(n, grid, bot, princess)
    @required_moves = n
    @grid = grid
    @bot_row = bot.row
    @bot_column = bot.column
    @princess_row = princess.row
    @princess_column = princess.column
    @vector = direction
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
    @required_moves.times do
      puts @vector
    end
  end
end

class ValidateInput
  def self.check_size(n)
    if !n.odd? || n < 3 || n >= 100
      puts 'RE-ENTER INPUT PARAMETERS'
    end
  end
end 

def nextMove(n,r,c,grid)
  ValidateInput.check_size(n)
  mario = Bot.new(r, c)
  peach = Princess.new(n, grid)
  matrix = Navigator.new(n, grid, mario, peach)
  matrix.next_move
end
  ```
