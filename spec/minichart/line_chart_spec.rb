require 'spec_helper'

describe LineChart do
  subject { described_class.new [1,2,3] }

  spec_from_yaml 'line_chart'

  describe '#options' do
    it "returns all options" do
      expect(subject.options.to_yaml).to match_approval('options/default.yaml')
    end
  end
end