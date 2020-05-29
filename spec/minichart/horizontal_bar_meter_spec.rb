require 'spec_helper'

describe HorizontalBarMeter do
  subject { described_class.new value, options }
  let(:value) { 75 }
  let(:base_options) { default_options.merge zero_line: true }
  let(:options) { base_options }

  it "works" do
    expect(subject.render).to match_approval 'horizontal_bar_meter/positive.svg'
  end

  context "with mode: :negative" do
    let(:value) { -75 }
    let(:options) { base_options.merge mode: :negative }

    it "works" do
      expect(subject.render).to match_approval 'horizontal_bar_meter/negative.svg'
    end
  end

  context "with mode: :dual" do
    let(:options) { base_options.merge mode: :dual }

    context "with a positive value" do
      let(:value) { 60 }

      it "works" do
        expect(subject.render).to match_approval 'horizontal_bar_meter/dual-positive.svg'
      end
    end

    context "with a negative value" do
      let(:value) { -60 }

      it "works" do
        expect(subject.render).to match_approval 'horizontal_bar_meter/dual-negative.svg'
      end
    end
  end

  context "with mode: :auto" do
    let(:options) { base_options.merge mode: :auto }

    context "with a positive value" do
      let(:value) { 60 }

      it "works" do
        expect(subject.render).to match_approval 'horizontal_bar_meter/auto-positive.svg'
      end
    end

    context "with a negative value" do
      let(:value) { -60 }

      it "works" do
        expect(subject.render).to match_approval 'horizontal_bar_meter/auto-negative.svg'
      end
    end
  end
end
