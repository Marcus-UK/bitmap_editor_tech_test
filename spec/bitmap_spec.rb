require './lib/bitmap.rb'

describe Bitmap do
  subject(:bitmap) { described_class.new(3 ,3) }

  it 'creates a 2D array on instantion' do
    expected_image = [["O", "O", "O"],["O", "O", "O"], ["O", "O", "O"] ]
    expect(bitmap.image).to eq(expected_image)
  end

  it 'raises an error if the dimensions are greater than 250' do
    size_error = "The bitmap cannot have a height or width greater than 250."
    expect { described_class.new(251, 251) }.to raise_error(size_error)
  end

  describe '#display_image' do

    it ' outputs the current state of the image' do
      image_to_display = ("OOO\n" +
                          "OOO\n" +
                          "OOO\n")
      expect{ bitmap.display_image }.to output(image_to_display).to_stdout
    end
  end

  describe '#colour_pixel' do

    it 'changes the color of a pixel at the specified location' do
      bitmap.colour_pixel(1, 1, "C")
      expect(bitmap.image[0][0]).to eq "C"
    end

    it 'raises an error if the location passed is not on the bitmap' do
      location_error = 'Location is not on the bitmap.'
      expect{ bitmap.colour_pixel(4, 4, "C") }.to raise_error(location_error)
    end
  end
end
