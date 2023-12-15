require_relative("../app/engine")
require "pry"

describe Engine do
  describe "#part_number_sum" do
    let(:engine_schematic) do
      <<~TEXT
        467..114..
        ...*......
        ..35..633.
        ......#...
        617*......
        .....+.58.
        ..592.....
        ......755.
        ...$.*....
        .664.598..
      TEXT
    end

    subject { Engine.new(engine_schematic.split("\n")).part_number_sum }

    it { is_expected.to eq 4361 }
  end
end
