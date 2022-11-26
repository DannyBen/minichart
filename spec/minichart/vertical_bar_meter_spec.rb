require 'spec_helper'

describe VerticalBarMeter do
  subject { described_class.new 70 }

  spec_from_yaml 'vertical_bar_meter'

  describe '#options' do
    it 'returns all options' do
      expect(subject.options.to_yaml).to match_approval('options/vertical_bar_meter.yaml')
    end
  end
end
