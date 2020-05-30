require 'spec_helper'

describe HorizontalBarMeter do
  subject { described_class.new 70 }

  spec_from_yaml 'horizontal_bar_meter'

  describe '#options' do
    it "returns all options" do
      expect(subject.options.to_yaml).to match_approval('options/horizontal_bar_meter.yaml')
    end
  end
end
