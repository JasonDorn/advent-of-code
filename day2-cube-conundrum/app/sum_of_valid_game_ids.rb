require_relative "game"

class SumOfValidGameIds
  attr_reader :game_inputs, :maxes

  DEFAULT_MAXES = {
    "red" => 12,
    "green" => 13,
    "blue" => 14
  }.freeze

  def initialize(args = {})
    @game_inputs = args[:game_inputs] || default_game_inputs
    @maxes = args[:maxes] || DEFAULT_MAXES
  end

  def call
    game_inputs.inject(0) do |sum, game_string|
      game = Game.new(game_string)
      if game.valid?(maxes)
        sum + game.index
      else
        sum + 0
      end
    end
  end

  private

  def default_game_inputs
    File.readlines("app/inputs.yml").map(&:chomp)
  end
end
