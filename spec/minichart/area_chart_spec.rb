require 'spec_helper'

describe AreaChart do
  subject { described_class.new [1, 2, 3] }

  spec_from_yaml 'area_chart'

  describe '#options' do
    it 'returns all options' do
      expect(subject.options.to_yaml).to match_approval('options/default.yaml')
    end
  end
end
