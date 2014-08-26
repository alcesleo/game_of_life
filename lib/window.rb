require 'hasu'
require './lib/world'

class GameOfLife < Hasu::Window
  attr_reader :width, :height, :world

  def initialize
    @width, @height = 1000, 800
    fullscreen = false
    super(width, height, fullscreen)
    self.caption = "Conway's Game of Life"

    @background_color = Gosu::Color.new(0xfff0f0f0)
    @cell_color = Gosu::Color.new(0xff666666)
    @cell_size = 5
    @world = World.new(Array.new(height / @cell_size) { Array.new(width / @cell_size) { Cell.random(10) } } )
  end

  def needs_cursor?; true; end

  def update
    @world = @world.next
  end

  def draw
    draw_background
    draw_world
  end

  private

  def draw_block(top, left, width, height, color)
    draw_quad(left,         top,          color,
              left + width, top,          color,
              left,         top + height, color,
              left + width, top + height, color)
  end
  def draw_background
    draw_block(0, 0, @width, @height, @background_color)
  end

  def draw_cell(x, y)
    draw_block(y * @cell_size, x * @cell_size, @cell_size, @cell_size, @cell_color)
  end

  def draw_world
    world.each_cell do |cell, x, y|
      draw_cell(x, y) if cell.alive?
    end
  end

  
end

GameOfLife.run
