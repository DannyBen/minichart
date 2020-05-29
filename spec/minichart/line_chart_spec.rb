require 'spec_helper'

describe LineChart do
  subject { described_class.new data, options }
  let(:data) { [10, 30, 20, 40, 30] }
  let(:options) { default_options }

  it "works" do
    expect(subject.render).to match_approval 'line_chart.svg'
  end
end