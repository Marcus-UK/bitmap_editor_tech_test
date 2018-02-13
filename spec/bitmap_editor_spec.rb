require'./lib/bitmap_editor'

describe BitmapEditor do
subject(:bitmap_editor) { described_class.new }

  describe '#run' do
    it 'creates a bitmap using the provided instructions and displays it' do
      show_test_file = './spec/fixtures/show_test_file.txt'
      expected_image= ("OOOO\n" +
                       "OOOO\n" +
                       "OOOO\n")
      expect{ bitmap_editor.run(show_test_file) }.to output(expected_image).to_stdout
    end
  end


end
