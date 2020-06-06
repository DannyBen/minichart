require 'spec_helper'

describe HorizontalStatusLeds do
  subject { described_class.new [1,1,1,0,-1] }

  spec_from_yaml 'horizontal_status_leds'

  describe '#options' do
    it "returns all options" do
      expect(subject.options.to_yaml).to match_approval('options/horizontal_status_leds.yaml')
    end
  end
end
