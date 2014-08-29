require './lib/game_of_life_window'
require './lib/themes'

class ColorizedGameOfLifeWindow < GameOfLifeWindow

  def initialize(*args, theme: Theme::Focus)
    @colorizer = theme.new
    super(*args)
  end

  private
  def draw_cell(x, y)
    super(x, y, get_cell_color(x, y))
  end

  def styles
    super
    if @colorizer.respond_to? :styles
      @colorizer.styles.each do |name, value|
        instance_variable_set("@#{name}", value)
      end
    end
  end

  def get_cell_color(x, y)
    @colorizer.cell_color(world, x, y)
  end

end
