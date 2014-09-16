require './lib/game_of_life_window'
require './lib/themes/themes'

class ThemedGameOfLifeWindow < GameOfLifeWindow

  def initialize(game = GameOfLife.new, evolutions_per_second = 10, theme = Theme::Focus)
    @theme = theme
    @colorizer = theme.new
    super(game, evolutions_per_second)
  end

  def cell_color(x, y)
    @colorizer.cell_color(world, x, y)
  end

  def background_color
    if @colorizer.respond_to? :background_color
      @colorizer.background_color
    else
      super
    end
  end

  private

  def cycle_themes
    # get all theme classes
    @themes ||= Theme.constants.map { |name| Theme.const_get(name) }
    @theme = (@themes - [@theme]).first
    @colorizer = @theme.new
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
