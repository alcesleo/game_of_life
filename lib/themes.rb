module Theme
  class Deutschland

    def cell_color(world, x, y)
      number_of_alive_neighbors = world.number_of_alive_neighbors(x, y)

      if number_of_alive_neighbors < 2
        Gosu::Color::BLACK
      elsif number_of_alive_neighbors > 3
        Gosu::Color::RED
      else
        Gosu::Color.new(0xffffcc00)
      end
    end

  end

  class Focus

    SHADES = [
      0xff98f5ff,
      0xff63d1f4,
      0xff00b2ee,
      0xff0198e1,
      0xff1c86ee,
      0xff1874cd,
      0xff2b4f81,
      0xff003f87,
      0xff162252,
    ].map do |hex|
      Gosu::Color.new(hex)
    end

    def styles
      super
      @background_color = Gosu::Color.new(0xffbbffff)
    end

    def cell_color(world, x, y)
      SHADES[world.number_of_alive_neighbors(x, y)]
    end
  end
end
