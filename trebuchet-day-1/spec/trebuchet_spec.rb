require_relative "../app/trebuchet"

describe Trebuchet do
  let(:input_lines) do
    %w[
      9eightone
      5bszzkpcdxqkvkf7tgcone2
      8937
    ]
  end

  describe "#calibration_value" do
    subject { Trebuchet.new(input_lines).calibration_value }

    it { is_expected.to eq(99 + 52 + 87) }
  end
end
