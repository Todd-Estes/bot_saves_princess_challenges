class NextMove
  
  def self.next_move(n, r, c, grid)
    princess_position = (find_princess_position(n, grid)).flatten!
    p_row = princess_position[0]
    p_col = princess_position[1]
    if r < p_row
      puts 'DOWN'
    elsif r > p_row
      puts 'UP'
    elsif c < p_col
      puts 'RIGHT'
    elsif c > p_col
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
end
