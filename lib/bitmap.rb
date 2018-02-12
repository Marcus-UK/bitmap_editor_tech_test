class Bitmap
MAX_DIMENSION = 250
attr_reader :image

  def initialize(width, height)
    raise max_size_error if dimension_too_large?(width, height)
    @image = Array.new(height) { Array.new(width, "O") }
  end

  def display_image
    image.each { |row| puts row.join("")}
  end

  private

  def max_size_error
    "The bitmap cannot have a height or width greater than #{MAX_DIMENSION}."
  end

  def dimension_too_large?(width, height)
    width > 250 || height > 250
  end


end
