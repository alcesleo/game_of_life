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
    new(survival_rate > rand(100))
  end

  def alive?
    @alive
  end

  def dead?
    !alive?
  end

  def evolve(number_of_neighbors)
    Cell.new(survives?(number_of_neighbors))
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

  private
  def survives?(number_of_neighbors)
    if alive?
      number_of_neighbors.between?(2, 3)
    else
      number_of_neighbors == 3
    end
  end

end
