require 'spec_helper'

describe Base do

  describe "class methods" do
    # Using a typical subclass
    subject { LineChart }

    describe '::options' do
      it "returns default options" do
        expect(subject.options).to be_a Hash
        expect(subject.options).to eq subject.master_defaults
      end
    end

    describe '::options[]=' do
      before { @original_background = subject.options[:background] }
      after  { subject.options[:background] = @original_background }
      let(:instance) { subject.new [1,2] }

      it "allows overriding instance options at the class level" do
        subject.options[:background] = 'light-blue'
        expect(instance.options[:background]).to eq 'light-blue'
      end
    end
  end
end