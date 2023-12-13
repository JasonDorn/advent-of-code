require_relative "../app/trebuchet"

describe Trebuchet do
  let(:input_lines) do
    %w[
      9eightone9
      5bszzkpcdxqkvkf7tgcone2
      8937
    ]
  end

  describe "#calibration_value" do
    subject { Trebuchet.new(input_lines).calibration_value }

    it { is_expected.to eq(99 + 52 + 87) }

    context "with numbers spelled out at the end" do
      let(:input_lines) do
        %w[
          eightone
          two5bszzkpcdxqkvkf7tgcone2three
          five8937four
          eightthreeseven2nnkvlzxkvhszfpqzhl37ddqvnxg
          sixeighttwone
        ]
      end

      it { is_expected.to eq(81 + 23 + 54 + 87 + 61) }
    end

    context "with numbers spelled out at the end but overlapping names" do
      let(:input_lines) { %w[sevenine] }

      it { is_expected.to eq(79) }
    end

    context "with numbers spelled out at the beginning" do
      let(:input_lines) { %w[fourvptdnbpqcxktwoone4oneone] }

      it { is_expected.to eq(41) }
    end
  end
end
