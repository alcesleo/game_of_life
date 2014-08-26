require 'hasu'

class GameOfLife < Hasu::Window
  def initialize
    fullscreen = false
    @width, @height = 640, 480
    super(640, 480, fullscreen)

    @world = World.new(Array.new(height) { Array.new(width) { Cell.random } })

    @background_color = Gosu::Color.new(0xf0f0f0f0)
  end

  def needs_cursor?; true; end

  def update
  end

  def reset
  end

  def draw
    clear
  end

  private
  def clear
    draw_quad(0,   0,   @background_color,
              640, 0,   @background_color,
              640, 480, @background_color,
              0,   480, @background_color)
  end

  
end

GameOfLife.run
