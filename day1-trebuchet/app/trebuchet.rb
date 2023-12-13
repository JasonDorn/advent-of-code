require "pry"

class Trebuchet
  attr_reader :input_lines
  CHAR_DIGIT_MAP = {
    one: "o1ne",
    two: "t2wo",
    three: "t3hree",
    four: "f4our",
    five: "f5ive",
    six: "s6ix",
    seven: "s7even",
    eight: "e8ight",
    nine: "n9ine"
  }.freeze

  def initialize(input_lines = File.readlines("app/input.yml").map(&:chomp))
    @input_lines = input_lines
  end

  def calibration_value
    two_number_list.inject(:+)
  end

  private

  def number_list
    input_lines.map do |line|
      CHAR_DIGIT_MAP.each { |key, value| line.gsub!(key.to_s, value) }
      line.gsub(/[^0-9]/, "")
    end
  end

  def two_number_list
    number_list.map do |numbers|
      return 0 if numbers.empty?

      number_array = numbers.chars
      "#{number_array.first}#{number_array.last}"
    end.map(&:to_i)
  end
end
