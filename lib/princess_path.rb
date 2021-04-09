class PrincessPath

  def display_path_to_princess(n,grid)
    center = ((n - 1) / 2)
    if grid[0][0] == 'p'
     center.times do
       puts 'UP', 'LEFT'
     end
   elsif grid[0][-1] == 'p'
     center.times do
       puts 'UP', 'RIGHT'
     end
   elsif grid[-1][0] == 'p'
     center.times do
       puts 'DOWN', 'LEFT'
     end
   else
     center.times do
       puts 'DOWN', 'RIGHT'
     end
   end
  end
end
