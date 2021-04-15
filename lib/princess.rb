class Princess
  attr_reader :grid_size, :grid, :column, :row
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
