require_relative 'bitmap'
require_relative 'text_parser'

class BitmapEditor

  attr_reader :parser, :bitmap

  def initialize(parser = TextParser.new)
    @parser = parser
  end

  def run(file)
    instructions = parser.parse(file)
    instructions.each do |instruction|
      if instruction[0] == "I" && command_valid?(instruction)
        create_bitmap(instruction[1], instruction[2])
      elsif command_valid?(instruction)
        raise bitmap_error if bitmap_does_not_exist
        bitmap.command_interpreter(instruction)
      else
        raise 'Please enter a valid command.'
      end
    end
  end


  def create_bitmap(width, height)
    @bitmap = Bitmap.new(width, height)
  end

private

  def command_valid?(instruction)
    instruction[0] =~ /[ICLVHS]/ ? true : false
  end

  def bitmap_does_not_exist
    bitmap.nil?
  end

  def bitmap_error
    'You must create a bitmap first.'
  end
end
