require 'hasu'
require './lib/world'

class GosuRunner < Gosu::Window
  prepend Hasu::Guard

  def initialize(world, evolutions_per_second)
    @world = world
    @cell_size = 10

    # calculate window size to match world
    @width = @world.width * @cell_size
    @height = @world.height * @cell_size

    fullscreen = false
    super(@width, @height, fullscreen, 1000 / evolutions_per_second)
    self.caption = "Conway's Game of Life"

    reset
  end

  def needs_cursor?; true; end

  def reset
    @background_color = Gosu::Color.new(0xfff0f0f0)
    @cell_color       = Gosu::Color.new(0xff666666)
    @grid_color       = Gosu::Color.new(0xffe0e0e0)
    @text_color       = Gosu::Color.new(0x99000000)
    @font             = Gosu::Font.new(self, "Arial", 24)
  end

  def update
    @world = @world.next
  end

  def draw
    draw_background
    draw_grid
    draw_cells
    draw_counter
  end

  def run
    show
  end

  private

  def draw_background
    draw_rect(0, 0, @width, @height, @background_color)
  end

  def draw_cells
    @world.each_cell do |cell, x, y|
      draw_cell(x, y) if cell.alive?
    end
  end

  def draw_cell(x, y)
    draw_rect(y * @cell_size, x * @cell_size, @cell_size, @cell_size, @cell_color)
  end

  def draw_counter
    @font.draw("Generation: #{@world.generation}", 10, 10, 1, 1, 1, @text_color)
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
