# Bot Saves Princess Challenges

The following code blocks will satisfy each of the two required HackerRank Bot Saves Princess challenges. Copy the code from each block and paste it within their respective code buffers to check their functionality. The methods used to pass the challenges are slightly different from the code that is actually included in the project repository (the repo code reflects ruby convetion in the method names and includes methods validating input for grid sizes (n)).

**Bot Saves Princess 1** 
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

**Bot Saves Princess 2** 
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
