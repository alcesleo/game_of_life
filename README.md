# Conways Game Of Life

## Installation

    # Gosu needs some native extensions
    brew install sdl2 libogg libvorbis
    bundle install

## Running

    ruby lib/game_of_life.rb

## Rules

The [Wikipedia page](http://en.wikipedia.org/wiki/Conway's_Game_of_Life) has lots of details and examples.

1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overcrowding.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
