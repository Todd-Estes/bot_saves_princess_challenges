class BotSavesPrincessTwo
  def self.next_move(n, r, c, grid)
    # Check that grid size satisfies parameters
    validate_size_input(n)
    princess_position = (find_princess_position(n, grid)).flatten
    p_row = princess_position[0]
    p_col = princess_position[1]
    # r is bot's row; c is bot's column
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

  def self.validate_size_input(n)
    #N must be odd and (3 <= N < 100)
    if !n.odd? || n < 3 || n >= 100
      puts 'RE-ENTER INPUT PARAMETERS'
    end
  end

  def self.find_princess_position(n, grid)
    # check grid for p
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
