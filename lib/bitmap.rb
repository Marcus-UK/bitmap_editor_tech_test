class Bitmap

attr_reader :image

  def initialize(width, height)
    @image = Array.new(height) { Array.new(width, "O") }
  end

end
