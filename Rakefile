require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task :default => :spec

desc "Run black and white game of life"
task :run do
  require './lib/game_of_life_window'
  GameOfLifeWindow.run
end

namespace :run do
  desc "Run themed game of life"
  task :colors do
    require './lib/themes/themed_game_of_life_window'
    ThemedGameOfLifeWindow.run
  end
end

