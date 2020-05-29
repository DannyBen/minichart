require 'spec_helper'

describe Meter do
  subject { described_class.new value, options }
  let(:value) { 75 }
  let(:options) { {} }

  it "raises NotImplementedError" do
    expect { subject }.to raise_error(NotImplementedError)
  end
end