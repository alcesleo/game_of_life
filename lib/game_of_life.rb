require './lib/world'
require './lib/cell'

class GameOfLife

  attr_reader :world

  def initialize(world = reset_world!)
    @world = world
  end

  def tick!
    @world = world.next
  end

  def reset_world!
    @world = random_world(64, 48)
  end

  def random_world(width, height)
    World.new(Array.new(height) { Array.new(width) { Cell.spawn } } )
  end

end
