class BotSavesPrincess

  def self.display_path_to_princess(n,grid)

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
end

def validate_size_input(n)
  #
  if !n.odd? || n < 3 || n >= 100
    puts 'RE-ENTER INPUT PARAMETERS'
  end
end
