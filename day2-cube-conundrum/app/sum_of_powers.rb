require_relative "game"

class SumOfPowers
  attr_reader :game_inputs

  def initialize(args = {})
    @game_inputs = args[:game_inputs] || default_game_inputs
  end

  def call
    game_inputs.inject(0) do |sum, game_string|
      sum + Game.new(game_string).power_number
    end
  end

  private

  def default_game_inputs
    File.readlines("app/inputs.yml").map(&:chomp)
  end
end
