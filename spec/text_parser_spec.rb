require './lib/text_parser.rb'


describe TextParser do
  subject(:text_parser) { described_class.new }

  it 'is instantiated with an empty array' do
    expect(text_parser.instructions).to eq []
  end

  describe '#parse' do
    it 'accepts a .txt file and converts each line to an individual array' do
      file = './spec/fixtures/parse_test_file.txt'
      text_parser.parse(file)
      expect(text_parser.instructions).to eq [['I', 5, 6], ['L', 1, 3, 'A'] ]
    end

    it 'returns an error if the file passed to it is not valid' do
      file = './spec/fixtures/invalid_test_file.txt'
      invalid_file_error = "Please provide a valid file."
      expect { text_parser.parse(file) }.to raise_error(invalid_file_error)
    end
  end
end
