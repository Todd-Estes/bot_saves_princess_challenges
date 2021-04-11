class BotSavesPrincess
  def self.display_path_to_princess(n,grid)
    # Check that grid size satisfies parameters
    validate_size_input(n)
    #moves, i.e. moves traveled from center of grid to princess
    moves = ((n - 1) / 2)
    #We know princess is in one of four courners
    #check top-left corner
    if grid[0][0] == 'p'
      moves.times do
        puts 'UP', 'LEFT'
      end
     #check top-right corner
    elsif grid[0][-1] == 'p'
      moves.times do
        puts 'UP', 'RIGHT'
      end
      #check bottom-left corner
    elsif grid[-1][0] == 'p'
      moves.times do
        puts 'DOWN', 'LEFT'
      end
    else
      #princess must be in bottom-right corner
      moves.times do
        puts 'DOWN', 'RIGHT'
      end
    end
  end

  def self.validate_size_input(n)
    #N must be odd and (3 <= N < 100)
    if !n.odd? || n < 3 || n >= 100
      puts 'RE-ENTER INPUT PARAMETERS'
    end
  end
end
