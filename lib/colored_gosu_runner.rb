require './lib/gosu_runner'

class ColoredGosuRunner < GosuRunner

  COLORS = [Gosu::Color::GRAY, Gosu::Color::AQUA, Gosu::Color::RED, Gosu::Color::GREEN, Gosu::Color::BLUE,
            Gosu::Color::YELLOW, Gosu::Color::FUCHSIA, Gosu::Color::CYAN, Gosu::Color::BLACK]

  def draw_cell(x, y)
    color = COLORS[@world.number_of_alive_neighbors(x, y)]
    super(x, y, color)
  end
end
