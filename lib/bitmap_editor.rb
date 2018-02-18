require_relative 'bitmap'
require_relative 'text_parser'

class BitmapEditor

  attr_reader :parser, :bitmap

  def initialize(parser = TextParser.new)
    @parser = parser
  end

  def run(file)
    commands = parser.parse(file)
    commands.each do |command|
      command_router(command)
    end
  end


  def create_bitmap(width, height)
    @bitmap = Bitmap.new(width, height)
  end

private

  def command_router(command)
    if command[0] == "I" && command_valid?(command)
      create_bitmap(*command[1..2])
    elsif command_valid?(command)
      raise bitmap_error if bitmap_does_not_exist
      bitmap.command_interpreter(command)
    else
      raise 'Please enter a valid command.'
    end
  end

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
