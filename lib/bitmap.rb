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
      when 'L' then colour_pixel(command[1], command[2], command[3])
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

  def max_size_error
    "The bitmap cannot have a height or width greater than #{MAX_DIMENSION}."
  end

  def location_error
    'Location is not on the bitmap.'
  end

  def invalid_location?(x_loc, y_loc)
    !image.dig(x_loc - 1, y_loc - 1)
  end


  def dimension_too_large?(width, height)
    width > 250 || height > 250
  end
end
