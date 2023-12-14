require "pry"

class Game
  attr_reader :game_string
  VALID_COLORS = %w[red blue green].freeze

  def initialize(game_string)
    @game_string = game_string
  end

  def index
    split_game_string.first.gsub(/[^0-9]/, "").to_i
  end

  def valid?(color_maxes)
    VALID_COLORS.each { |color| return false unless send("#{color}_valid?", color_maxes[color]) }
    true
  end

  def power_number
    minimum_set = {
      "red" => 0,
      "green" => 0,
      "blue" => 0
    }

    rounds.each do |round|
      count, color = round.split(" ")
      if count.to_i > minimum_set[color]
        minimum_set[color] = count.to_i
      end
    end

    minimum_set.values.compact.inject(:*)
  end

  private

  VALID_COLORS.each do |color|
    define_method("#{color}_valid?") do |max_color_count|
      rounds.all? do |round|
        if !round.include?(color)
          true
        else
          max_color_count >= round.split(" ").first.to_i
        end
      end
    end
  end

  def split_game_string
    @split_game_string ||= @game_string.split(":")
  end

  def rounds_separated
    @rounds_separated ||= split_game_string.last.split(";").map(&:strip)
  end

  def rounds
    @rounds ||= rounds_separated.map { |r| r.split(",") }.flatten.map(&:strip)
  end
end
