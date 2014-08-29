require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = "--color --format=documentation"
end

task :default => :spec

task :run do
  require './lib/colorized_game_of_life_window'
  ColorizedGameOfLifeWindow.run(theme: Theme::Focus)
end
