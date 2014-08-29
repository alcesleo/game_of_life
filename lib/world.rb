class World
  attr_reader :cells, :generation

  def initialize(cells, generation = 1)
    @cells, @generation = cells, generation
  end

  def next
    new_cells = map_cells do |cell, x, y|
      count = number_of_alive_neighbors(x, y)
      cell.evolve(count)
    end
    World.new(new_cells, self.generation + 1)
  end

  def number_of_alive_neighbors(x, y)
    neighbors(x, y).count(&:alive?)
  end

  def inspect
    "#<World (generation #{generation})>"
  end

  def to_s
    cells.map { |row| row.join }.join("\n")
  end

  def each_cell
    cells.each_with_index do |row, y|
      row.each_with_index do |cell, x|
        yield(cell, x, y)
      end
    end
  end

  def width
    cells[0].size
  end

  def height
    cells.size
  end

  private

  def neighbors(x, y)
    constrained_neighborhood_indices(x, y).map { |x, y| cells[y][x] }
  end

  # returns a list of [x, y] index pairs for a 3x3 square with x,y in the center
  def neighborhood_indices(x, y)
    [*x-1..x+1].flat_map { |nx| [*y-1..y+1].map { |ny| [nx, ny] } }
  end

  def constrained_neighborhood_indices(x, y)
    neighborhood_indices(x, y)
      .-( [[x, y]] )                               # remove center
      .reject { |x, y| x < 0 || y < 0 }            # remove reverse indices
      .reject { |x, y| x >= width || y >= height } # remove out of bounds
  end

  def map_cells
    cells.map.with_index do |row, y|
      row.map.with_index do |cell, x|
        yield(cell, x, y)
      end
    end
  end

end
