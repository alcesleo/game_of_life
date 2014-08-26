require './lib/cell'

class World
  attr_reader :cells, :generation

  def initialize(cells, generation = 1)
    @cells, @generation = cells, generation
  end

  def next
    new_cells = map_cells do |cell, x, y|
      count = number_of_alive_neighbors(x, y)
      cell.natural_selection(count)
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
      self[x-1, y-1], self[x, y-1], self[x+1, y-1],
      self[x-1, y],                 self[x+1, y],
      self[x-1, y+1], self[x, y+1], self[x+1, y+1],
    ].compact
  end

  def [](x, y)
    return nil if x < 0 || y < 0 # prevent rear indexing
    # return nil if x >= cells.size || y >= cells[0].size # prevent index out of bounds

    # TODO: FIX THIS ATROCITY AND TEST WITH EMPTY ARRAY
    cells[y][x] rescue nil
  end

end
