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

  describe '#command_interpreter' do

    it 'takes an S command and outputs the image' do
      image_to_display = ("OOO\n" +
                          "OOO\n" +
                          "OOO\n")
      expect{ bitmap.command_interpreter(['S']) }.to output(image_to_display).to_stdout
    end

    it 'takes an L command and changes the colour of the specified pixel' do
      bitmap.command_interpreter(['L', 1, 1,'C'])
      expect(bitmap.image[0][0]).to eq "C"
    end

    it 'raises an error if an L command is passed an invalid location' do
      loc_error = 'Location is not on the bitmap.'
      expect{ bitmap.command_interpreter(['L', 4, 4, 'C']) }.to raise_error(loc_error)
    end

    it 'takes a V command and draws a vertical line on the bitmap' do
      bitmap.command_interpreter(['V', 1, 1, 3, 'C'])
      expect(bitmap.image).to eq([['C','O', 'O'], ['C', 'O', 'O'], ['C', 'O', 'O']])
    end

    it 'raises an error if V command line goes off the bitmap' do
      line_error = 'Location is not on the bitmap.'
      expect{ bitmap.command_interpreter(['V', 1, 1, 4, 'C']) }.to raise_error(line_error)
    end

    it 'takes an H command and draws a horizontal line on the bitmap' do
      bitmap.command_interpreter(['H', 1, 3, 1, 'C'])
      expect(bitmap.image).to eq([['C', 'C', 'C'], ['O','O','O'], ['O', 'O','O']])
    end

    it 'raises an error if H command line goes off the bitmap' do
      line_error = 'Location is not on the bitmap.'
      expect{ bitmap.command_interpreter(['H', 1, 4, 1, 'C']) }.to raise_error(line_error)
    end

    it 'takes a C command and resets the bitmap to its original state' do
      bitmap.command_interpreter(['V', 1, 3, 1, 'C'])
      bitmap.command_interpreter(['C'])
      expect(bitmap.image).to eq([['O', 'O', 'O'], ['O', 'O', 'O'], ['O', 'O', 'O']])
    end
  end
end
