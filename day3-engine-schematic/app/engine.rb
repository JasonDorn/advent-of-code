require "pry"
class Engine
  attr_reader :engine_schematic

  def initialize(engine_schematic = nil)
    @engine_schematic = engine_schematic || default_engine_schematic
  end

  def part_number_sum
    full_adjacent_numbers.sum
  end

  private

  def full_adjacent_numbers
    adjacent_number_map.each_with_object([]) do |(row, columns), array|
    end
  end

  def adjacent_number_map
    symbol_adjacent_map.transform_values do |row_data|
      row_data.select { |_, value| value.match?(/\d/) }
    end.reject { |_, value| value.empty? }
  end

  def symbol_adjacent_map
    symbol_map.each_with_object(empty_coordinate_hash) do |(row, columns), hash|
      adjacent_numbers(row).each do |row_index|
        columns.each do |column_index, value|
          adjacent_numbers(column_index).each do |column|
            hash[row_index][column] = mapped_schematic[row_index][column]
          end
        end
      end
    end
  end

  def symbol_map
    @symbol_map ||= mapped_schematic.map do |row, columns|
      [row, columns.reject { |_, value| value.match?(/[0-9.]/) }]
    end.to_h.reject { |_, value| value.empty? }
  end

  def mapped_schematic
    row_count = 0
    engine_schematic.each_with_object(empty_coordinate_hash) do |row, hash|
      row.chars.each_with_index do |char, column|
        hash[row_count][column] = char
      end
      row_count += 1
    end
  end

  def default_engine_schematic
    File.readlines("config/engine_schematic.yml").map(&:chomp)
  end

  def empty_coordinate_hash
    Hash.new { |hash, key| hash[key] = {} }
  end

  def adjacent_numbers(number)
    [number - 1, number, number + 1].filter { |row| row >= 0 }
  end
end
