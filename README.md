# Bot Saves Princess Challenges

The following code blocks will satisfy each of the two required HackerRank Bot Saves Princess challenges. Copy the code from each block and paste it within its respective code buffers to check its functionality. The methods used to pass the challenges are slightly different from the code that is actually included in the project repository (the repo code reflects ruby convention in the method names and includes methods validating input for grids).

Each code challege has its own class which contains the methods needed to solve it, along with associated test files that test command line output. There is no actual input logic (i.e. _gets_ method) in any of the class methods.
_________________________________________________________________________________________________________________________________
**Bot Saves Princess 1** <br />
This challenge could have been set with just two moves, as the test case always uses a 3x3 grid. However, in the instructions it is explicitly stated that N, the grid size, could be anywhere between 3 and 99 (3 <= N < 100), aside from N also having to be an odd number. For the sake of the HackerRank challenge code, I left out checking N for size or oddness, but those validations are included in the repo class files.
```
def displayPathtoPrincess(n,grid)
  moves = ((n - 1) / 2)
  
  if grid[0][0] == 'p'
    moves.times do
      puts 'UP', 'LEFT'
    end
  elsif grid[0][-1] == 'p'
    moves.times do
      puts 'UP', 'RIGHT'
    end
  elsif grid[-1][0] == 'p'
     moves.times do
       puts 'DOWN', 'LEFT'
     end
  else
    moves.times do
      puts 'DOWN', 'RIGHT'
    end
  end
end
```
___________________________________________________________________________________________________________________________________
**Bot Saves Princess 2** <br />
This block of code includes two methods - just be sure copy and paste the entire block in the place of the _nextMove_ method on lines 3-5 in the HackerRank code buffer.

Though not explicitly stated in the instructions, I made the assumption that the challenge's N input had the same restrictions as the first Bot Saves Princess challenge.
```
def self.nextMove(n, r, c, grid)
  princess_position = (find_princess_position(n, grid)).flatten
  p_row = princess_position[0]
  p_col = princess_position[1]
  
  if r != p_row
    if r < p_row
      puts 'DOWN'
    else
      puts 'UP'
    end
  elsif c < p_col
    puts 'RIGHT'
  else
    puts 'LEFT'
  end
end

def self.find_princess_position(n, grid)
  row = []
  cell = []
  (0...n).each do |i|
    grid[i].split('').each_with_index do |char, index|
      if char == 'p'
        row << i
        cell << index
      end
    end
  end
  return row, cell
end
  ```
