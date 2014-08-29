require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = "--color --format=documentation"
end

task :default => :spec

task :run do
  require './lib/game_of_life_window'
  GameOfLifeWindow.run
end

task :colors do
  require './lib/colors/colorized_game_of_life_window'
  ColorizedGameOfLifeWindow.run
end
