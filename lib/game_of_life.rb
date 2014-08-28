require './lib/world'
require './lib/cell'
require './lib/gosu_runner'
require './lib/colored_gosu_runner'

class GameOfLife

  attr_reader :world, :evolutions_per_second

  def initialize(world: random_world(64, 48), evolutions_per_second: 10, runner: GosuRunner)
    @world, @evolutions_per_second, @runner = world, evolutions_per_second, runner
  end

  def run
    @runner.new(world, evolutions_per_second).run
  end

  def random_world(width, height)
    @world = World.new(Array.new(height) { Array.new(width) { Cell.spawn } } )
  end

end
