# Bot Saves Princess Challenges

The following code blocks will satisfy each of the two required HackerRank Bot Saves Princess challenges. Copy the code from each block and paste it within its respective code buffers to check its functionality. The methods used to pass the challenges are slightly different from the code that is actually included in the project repo (the repo code reflects ruby convention in the method names and includes methods validating input for grids).

Within the repo, each code challege has its own class file which contains the methods needed to solve it, along with associated test files that test command line output. There is no actual input logic (i.e. _gets_ method) in any of the class methods.
_________________________________________________________________________________________________________________________________
**Bot Saves Princess 1** <br />
This challenge could have been set with just two moves, as the test case always uses a 3x3 grid and we know the bot is at its middle, with the princess at one of its four corners. However, in the instructions it is explicitly stated that N, the grid size, could be anywhere between 3 and 99 (3 <= N < 100), aside from N also having to be an odd number.

For the sake of the HackerRank challenge code, I left out checking N for size and oddness, but those validations are included in the repo class files.

The changes that I made to the original Bot Saves Princess 1 challenge basically remove the BotSavesPrincess class and treat the displayPathtoPrincess method just as a "runner" file. I felt that by creating separate Bot and Princess classes I gave more modularity for future additions to the code. One could instantiate multiple princesses, and multiple bots could also be created in the future using its own _find_princess_position_-like method, without the row and column of the bot being given.

The Navigator class handles the logic which provides the directional-based output solutions for the challenges. I feel like the methods are built and abstracted ideally for future iterative improvements. I do feel like the _next_move_ and _direction_ methods logic is similar enough to where they could be used as one method solved different types of problems, but I didn't quite have the time to figure out how to do it.
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

    def get_to_row
    if @bot_row > @princess_row
      (0...(@bot_row - @princess_row)).each do
        puts 'UP'
      end
    elsif @bot_row < @princess_row
      (0...(@bot_row - @princess_row).abs).each do
        puts 'DOWN'
      end
    end
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

def displayPathtoPrincess(n,grid)
    moves = ((n - 1) / 2)
    mario = Bot.new(moves, moves)
    peach = Princess.new(n, grid)
    matrix = Navigator.new(moves, grid, mario, peach)
    matrix.display_direction
end

```
___________________________________________________________________________________________________________________________________
**Bot Saves Princess 2** <br />
This block of code includes two methods - just be sure copy and paste the entire block in the place of the _nextMove_ method on lines 3-5 in the HackerRank code buffer.

Though not explicitly stated in the instructions, I made the assumption that the challenge's N input had the same restrictions as the first Bot Saves Princess challenge.

These are the exact same classes used in the first Bot Saves Princess challenge, with a different method being used from the Navigator class to render the bot's first directional move.
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

def nextMove(n,r,c,grid)
    mario = Bot.new(r, c)
    peach = Princess.new(n, grid)
    matrix = Navigator.new(n, grid, mario, peach)
    matrix.next_move
end
  ```
