require 'spec_helper'

describe Chart do
  subject { described_class.new data, options }
  let(:data) { [10, 30, 20, 40, 30] }
  let(:options) { {} }

  it "raises NotImplementedError" do
    expect { subject }.to raise_error(NotImplementedError)
  end
end