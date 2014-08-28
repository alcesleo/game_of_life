require './lib/gosu_runner'

class ColoredGosuRunner < GosuRunner

  PALETTE = [Gosu::Color::GRAY, Gosu::Color::AQUA, Gosu::Color::RED, Gosu::Color::GREEN, Gosu::Color::BLUE,
             Gosu::Color::YELLOW, Gosu::Color::FUCHSIA, Gosu::Color::CYAN, Gosu::Color::BLACK]


  DEUTSCHLAND = lambda { |number_of_alive_neighbors|
    if number_of_alive_neighbors < 2
      Gosu::Color::BLACK
    elsif number_of_alive_neighbors > 3
      Gosu::Color::RED
    else
      Gosu::Color.new(0xffffcc00)
    end
  }

  # coloring can be anything that responds to #[] and returns a Gosu::Color based on the number of neighbors
  def initialize(world, evolutions_per_second, coloring = DEUTSCHLAND)
    super(world, evolutions_per_second)
    @coloring = coloring
  end

  def draw_cell(x, y)
    color = @coloring[@world.number_of_alive_neighbors(x, y)]
    super(x, y, color)
  end
end
