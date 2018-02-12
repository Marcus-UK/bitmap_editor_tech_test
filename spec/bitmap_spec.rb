require './lib/bitmap.rb'

describe Bitmap do
  subject(:bitmap) { described_class.new(3 ,3) }

  it 'creates a 2D array on instantion' do
    expected_image = [["O", "O", "O"],["O", "O", "O"], ["O", "O", "O"] ]
    expect(bitmap.image).to eq(expected_image)
  end
end
