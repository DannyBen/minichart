require 'spec_helper'

describe Chart do
  subject { described_class.new data, options }
  
  let(:data) { [10, 30, 20, 40, 30] }
  
  let(:options) {{
    background: '#bc7',
    aspect_ratio: 4,
    height: 150,
    # width: 300 # aspect_ratio supercedes
    stroke: 3,
    style: { additional: 'styling' },
    color: 'purple'
  }}

  it "raises NotImplementedError" do
    expect { subject }.to raise_error(NotImplementedError)
  end

  describe LineChart do
    it "works" do
      expect(subject.render).to match_approval 'line_chart.svg'
    end
  end

  describe BarChart do
    it "works" do
      expect(subject.render).to match_approval 'bar_chart.svg'
    end
  end

  describe AreaChart do
    it "works" do
      expect(subject.render).to match_approval 'area_chart.svg'
    end
  end
end