require 'hasu'
Hasu.load './lib/game_of_life.rb'

class GameOfLifeWindow < Hasu::Window

  attr_reader :game

  def initialize(game = GameOfLife.new, evolutions_per_second = 10)
    @game      = game
    @cell_size = 10

    # calculate window size to match world
    @width      = world.width  * @cell_size
    @height     = world.height * @cell_size
    fullscreen  = false
    delay_in_ms = 1000 / evolutions_per_second

    # launch the window
    super(@width, @height, fullscreen, delay_in_ms)
    self.caption = "Conway's Game of Life"

    @grid_color = Gosu::Color.new(0xffe0e0e0)
    @text_color = Gosu::Color.new(0x99000000)
    @font       = Gosu::Font.new(self, "Arial", 24)
  end

  def world
    game.world
  end

  def background_color
    Gosu::Color.new(0xfff0f0f0)
  end

  def cell_color(x, y)
    Gosu::Color.new(0xff666666)
  end

  private

  def needs_cursor?; true; end

  def reset
    game.reset_world!
  end

  def update
    game.tick!
  end

  def button_down(key)
    case key
    when Gosu::KbQ
      close
    end
  end

  def draw
    draw_background
    draw_grid
    draw_cells
    draw_counter
  end

  def draw_background
    draw_rect(0, 0, @width, @height, background_color)
  end

  def draw_cells
    world.each_cell do |cell, x, y|
      draw_cell(x, y) if cell.alive?
    end
  end

  def draw_cell(x, y)
    draw_rect(y * @cell_size, x * @cell_size, @cell_size, @cell_size, cell_color(x, y))
  end

  def draw_counter
    @font.draw("Generation: #{world.generation}", 10, 10, 1, 1, 1, @text_color)
  end

  def draw_grid
    # vertical lines
    (0..@width).step(@cell_size) do |x|
      draw_line(x, 0,       @grid_color,
                x, @height, @grid_color)
    end

    # horizontal lines
    (0..@height).step(@cell_size) do |y|
      draw_line(0,      y, @grid_color,
                @width, y, @grid_color)
    end
  end

  def draw_rect(top, left, width, height, color)
    draw_quad(left,         top,          color,
              left + width, top,          color,
              left,         top + height, color,
              left + width, top + height, color)
  end

end
