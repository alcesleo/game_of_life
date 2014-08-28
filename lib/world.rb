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

  def map_cells
    cells.map.with_index do |row, y|
      row.map.with_index do |cell, x|
        yield(cell, x, y)
      end
    end
  end

  def neighbors(x, y)
    [
      cell_at(x-1, y-1), cell_at(x, y-1), cell_at(x+1, y-1),
      cell_at(x-1, y),                    cell_at(x+1, y),
      cell_at(x-1, y+1), cell_at(x, y+1), cell_at(x+1, y+1),
    ].compact
  end

  def cell_at(x, y)
    return nil if x < 0 || y < 0 # prevent rear indexing
    return nil if x >= width || y >= height # prevent index out of bounds

    cells[y][x]
  end

end
