require_relative "../app/game"

describe Game do
  describe "#power_number" do
    let(:game_string) { "Game 1: 1 red, 1 green, 1 blue; 1 red, 2 green, 2 blue" }

    subject { described_class.new(game_string).power_number }

    it { is_expected.to eq 1 }

    context "longer game" do
      let(:game_string) do
        "Game 2: 2 green, 2 blue, 16 red; 14 red; 13 red, 13 green, 2 blue; 7 red, 7 green, 2 blue"
      end

      it { is_expected.to eq 416 }
    end

    context "another longer game" do
      let(:game_string) do
        "Game 80: 9 blue, 4 red; 4 green, 3 blue, 4 red; 7 red, 9 blue, 4 green; 5 red, 9 blue, 4 green; 3 red, 11 blue, 5 green; 6 red, 4 green, 11 blue"
      end

      it { is_expected.to eq 385 }
    end
  end
end
