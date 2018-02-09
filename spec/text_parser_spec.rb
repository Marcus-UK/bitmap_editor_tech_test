require './lib/text_parser.rb'


describe TextParser do
  subject(:text_parser) { described_class.new }

  it 'is instantiated with an empty array' do
    expect(text_parser.instructions).to eq []
  end


end
