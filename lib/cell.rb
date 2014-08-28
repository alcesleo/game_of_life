class Cell

  def initialize(alive)
    @alive = !!alive
  end

  def self.alive
    new(true)
  end

  def self.dead
    new(false)
  end

  def self.spawn(survival_rate=50)
    new(rand < survival_rate / 100.0)
  end

  def alive?
    @alive
  end

  def dead?
    !alive?
  end

  def ==(other)
    self.alive? == other.alive?
  end

  def inspect
    "#<Cell (#{alive? ? 'alive' : 'dead'})>"
  end

  def to_s
    alive? ? 'o' : ' '
  end

  def natural_selection(number_of_neighbors)
    Cell.new(
      if alive?
        number_of_neighbors.between?(2, 3)
      else
        number_of_neighbors == 3
      end
    )
  end

end
