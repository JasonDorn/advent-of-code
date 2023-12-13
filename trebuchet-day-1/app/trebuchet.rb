class Trebuchet
  attr_reader :input_lines

  def initialize(input_lines = File.readlines("app/input.yml").map(&:chomp))
    @input_lines = input_lines
  end

  def calibration_value
    sum_each_line
  end

  private

  def number_list
    input_lines.map { |line| line.gsub(/[^0-9]/, "") }
  end

  def two_number_list
    number_list.map do |numbers|
      return 0 if numbers.empty?

      number_array = numbers.chars
      "#{number_array.first}#{number_array.last}"
    end.map(&:to_i)
  end

  def sum_each_line
    two_number_list.inject(:+)
  end
end
