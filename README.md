# Conway's Game Of Life

![](screenshot.png)

## Installation

```bash
# Gosu needs some native extensions
brew install sdl2 libogg libvorbis
bundle install
```

## Usage

Press `r` to reset the game, `t` to cycle themes and `q` to quit.

### Tasks

```bash
# start game of life
rake run
rake run:colors

# run the tests
rake spec
```

## Themes

You can create your own themes and pass into `ThemedGameOfLifeWindow.run`

```ruby
# a theme with red cells on a black background
class MyAwesomeTheme
  def background_color
    Gosu::Color.new(0xff000000)
  end

  def cell_color(world, x, y)
    Gosu::Color.new(0xffff0000)
  end
end

ThemedGameOfLifeWindow.run(theme: MyAwesomeTheme)
```

## Rules

The [Wikipedia page](http://en.wikipedia.org/wiki/Conway's_Game_of_Life) has lots of details and examples.

1. Any live cell with fewer than two live neighbours dies, as if caused by under-population.
2. Any live cell with two or three live neighbours lives on to the next generation.
3. Any live cell with more than three live neighbours dies, as if by overcrowding.
4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
