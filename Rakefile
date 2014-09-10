require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task :default => :spec

task :run do
  require './lib/game_of_life_window'
  GameOfLifeWindow.run
end

namespace :run do
  task :colors do
    require './lib/themes/themed_game_of_life_window'
    ThemedGameOfLifeWindow.run
  end
end

