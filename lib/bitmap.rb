class Bitmap
MAX_DIMENSION = 250

attr_reader :image

  def initialize(width, height)
    raise max_size_error if dimension_too_large?(width, height)
    @image = Array.new(height) { Array.new(width, "O") }
  end

  def command_interpreter(command)
    case command[0]
      when 'S' then display_image
      when 'L' then colour_pixel(*command[1..-1])
      when 'V' then draw_vertical_line(*command[1..-1])
      when 'H' then draw_horizontal_line(*command[1..-1])
    end
  end

private

  def display_image
    image.each { |row| puts row.join("")}
  end

  def colour_pixel(x_loc, y_loc, colour)
    raise location_error if invalid_location?(x_loc, y_loc)
    image[x_loc - 1][y_loc - 1] = colour
  end

  def draw_vertical_line(x_loc, y_start, y_end, colour)
    raise location_error if v_line_off_grid?(y_start, y_end)
    location = y_start
    until location > y_end do
      image[location - 1][ x_loc - 1] = colour
      location += 1
    end
  end

  def draw_horizontal_line(x_start, x_end, y_loc, colour)
    location = x_start
    until location > x_end do
      image[y_loc - 1][location - 1] = colour
      location += 1
    end
  end

  def max_size_error
    "The bitmap cannot have a height or width greater than #{MAX_DIMENSION}."
  end

  def location_error
    'Location is not on the bitmap.'
  end

  def invalid_location?(x_loc, y_loc)
    !image.dig(x_loc - 1, y_loc - 1)
  end

  def v_line_off_grid?(y_start, y_end)
    line_length = y_end - y_start
    y_start + line_length > image.length
  end

  def dimension_too_large?(width, height)
    width > 250 || height > 250
  end
end
