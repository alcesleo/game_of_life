require './lib/game_of_life_window'
require './lib/themes/themes'

class ThemedGameOfLifeWindow < GameOfLifeWindow

  def initialize(*args, theme: Theme::Focus)
    @theme = theme
    @colorizer = theme.new
    super(*args)
  end

  private
  def draw_cell(x, y)
    super(x, y, @colorizer.cell_color(world, x, y))
  end

  def styles
    super
    if @colorizer.respond_to? :styles
      @colorizer.styles.each do |name, value|
        instance_variable_set("@#{name}", value)
      end
    end
  end

  def cycle_themes
    # get all theme classes
    @themes ||= Theme.constants.map { |name| Theme.const_get(name) }
    @theme = (@themes - [@theme]).first
    @colorizer = @theme.new
    styles
  end

  def button_down(key)
    case key
    when Gosu::KbT
      cycle_themes
    else
      super
    end
  end

end
