require './lib/text_parser.rb'


describe TextParser do
  subject(:text_parser) { described_class.new }

  it 'is instantiated with an empty array' do
    expect(text_parser.instructions).to eq []
  end

  describe '#parse' do
    it 'accepts a .txt file and converts each line to an individual array' do
      file = './examples/parse_test_file.txt'
      text_parser.parse(file)
      expect(text_parser.instructions).to eq [['I', 5, 6], ['L', 1, 3, 'A'] ]
    end
  end




end
