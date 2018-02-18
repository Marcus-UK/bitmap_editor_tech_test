require'./lib/bitmap_editor'

describe BitmapEditor do
subject(:bitmap_editor) { described_class.new(parser_dbl) }
let(:parser_dbl) { double :TextParser,
                   :parse => [['I', 4, 3], ['S']] }

  describe '#run' do
    it 'creates a bitmap using the provided instructions and displays it' do
      expected_image= ("OOOO\n" +
                       "OOOO\n" +
                       "OOOO\n")
      expect{ bitmap_editor.run('text.txt') }.to output(expected_image).to_stdout
    end

    it 'raises an error if an invalid command is passed' do
      invalid_command_dbl = double :TextParser, :parse => [['I', 4, 3], ['X']]
      invalid_bitmap = described_class.new(invalid_command_dbl)
      command_error = 'Please enter a valid command.'
      expect{ invalid_bitmap.run('text.txt')}.to raise_error(command_error)
    end 
  end
end
