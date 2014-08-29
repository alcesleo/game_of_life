require './lib/game_of_life_window'
require './lib/themes'

class ColorizedGameOfLifeWindow < GameOfLifeWindow

  def initialize(*args, theme: Theme::Focus)
    super(*args)
    @colorizer = theme.new
  end

  def draw_cell(x, y)
    super(x, y, get_cell_color(x, y))
  end

  def get_cell_color(x, y)
    @colorizer.cell_color(world, x, y)
  end

end
