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
end
