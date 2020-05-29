require 'spec_helper'

describe Meter do
  subject { described_class.new value, options }
  let(:value) { 75 }
  let(:options) { default_options }

  it "raises NotImplementedError" do
    expect { subject }.to raise_error(NotImplementedError)
  end

  describe VerticalBarMeter do
    it "works" do
      expect(subject.render).to match_approval 'vertical_bar_meter.svg'
    end

    context "with inverse: true" do
      let(:value) { -75 }
      let(:options) { default_options.merge inverse: true }

      it "works" do
        expect(subject.render).to match_approval 'vertical_bar_meter_inverse.svg'
      end
    end
  end
end