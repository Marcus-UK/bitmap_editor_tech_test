class TextParser

  attr_reader :instructions

  def initialize(instructions = [])
    @instructions = instructions
  end

  def parse(file)
    raise invalid_file_error if invalid_file?(file)
    File.open(file).each do |line|
      instruction = line.split(" ")
      convert_string_to_integer(instruction)
      @instructions.push(instruction)
    end
    instructions
  end

  private

  def convert_string_to_integer(array)
    array.map! do |character|
      character =~ /[[:digit:]]/ ? character.to_i : character
    end
  end

  def invalid_file?(file)
    File.zero?(file) || !File.exist?(file)
  end

  def invalid_file_error
    "Please provide a valid file."
  end

end
