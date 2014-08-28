require './lib/world'
require './lib/cell'
require './lib/gosu_runner'

class GameOfLife

  attr_reader :world

  def initialize(world = random_world(64, 48), evolutions_per_second = 10, runner_type = GosuRunner)
    @runner = runner_type.new(world, evolutions_per_second)
  end

  def run
    @runner.run
  end

  def random_world(width, height)
    @world = World.new(Array.new(height) { Array.new(width) { Cell.spawn } } )
  end

end
