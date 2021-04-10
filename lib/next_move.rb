class NextMove

  def find_princess_position(n, grid)
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
