class TextParser

  attr_reader :instructions

  def initialize(instructions = [])
    @instructions = instructions
  end

  def parse(file)
    File.open(file).each do |line|
      instruction = line.split(" ")
      convert_string_to_integer(instruction)
      @instructions.push(instruction)
    end
  end

  private

  def convert_string_to_integer(array)
    array.map! do |character|
      character =~ /[[:digit:]]/ ? character.to_i : character
    end
  end
end
