require_relative "../app/sum_of_valid_game_ids"

describe SumOfValidGameIds do
  describe ".call" do
    let(:maxes) do
      {
        "red" => 12,
        "green" => 13,
        "blue" => 14
      }
    end
    let(:game_inputs) { [game1] }
    let(:game1) { "Game 1: 12 red" }

    subject { described_class.new({maxes: maxes, game_inputs: game_inputs}).call }

    it { is_expected.to eq 1 }

    context "when game has too many of a color" do
      let(:game1) { "Game 1: 13 red" }

      it { is_expected.to eq 0 }
    end

    context "when a game has multiple rounds" do
      let(:game1) { "Game 1: 12 red; 1 red" }

      it { is_expected.to eq 1 }
    end

    context "when a game has multiple colors" do
      let(:game1) { "Game 1: 1 red, 1 green, 1 blue" }

      it { is_expected.to eq 1 }
    end

    context "when a game has multiple rounds with different colors" do
      let(:game1) { "Game 1: 1 red, 1 green, 1 blue; 1 red, 1 green, 1 blue" }

      it { is_expected.to eq 1 }

      context "but extra round exceeds maxes" do
        let(:game1) { "Game 1: 1 red, 1 green, 1 blue; 13 red, 1 green, 1 blue" }

        it { is_expected.to eq 0 }
      end
    end

    context "with multiple games" do
      let(:game_inputs) { [game1, game2] }
      let(:game2) { game1.dup.gsub("Game 1", "Game 2") }

      it { is_expected.to eq 3 }
    end
  end
end
