require "spec_helper"

module Nine2Five

  module Basic

    describe Processor do

      let(:input)   { "input" }
      let(:input2)  { "input2" }
      let(:output)  { "output" }
      let(:output2) { "output2" }

      subject { eval(description(self)) }

      describe "initialization" do

        describe "Processor.new({name: :p, in: input, out: output}, &block)" do
          let(:block)  { Proc.new{} }

          its(:name) { should be :p}
          its(:in)   { should be input}
          its(:out)  { should be output}
        end

        describe "Processor.new :p" do
          its(:name) { should be :p}
        end

        describe "Processor.new :p1, name: :p2 # positional arg has precedence over named arg" do
          its(:name) { should be :p1}
        end

        describe "Processor.new :p, input" do
          its(:in) { should be input}
        end

        describe "Processor.new :p, input, input: input2 # positional arg has precedence over named arg" do
          its(:in) { should be input}
        end

        describe "Processor.new :p, input, output" do
          let(:output2) { "output2" }
          its(:out) { should be output}
        end

        describe "Processor.new :p, input, output, out: output2 # positional arg has precedence over named arg" do
          its(:out) { should be output}
        end
      end

      context "with an input of 'foo'" do

        before { input.should_receive(:get).and_return('foo') }

        describe "Processor.new :p, input" do
          its(:run) {should == 'foo'}
        end

        describe "Processor.new(:p, input) { |x| x + 'bar' }" do
          its(:run) {should == 'foobar'}
        end

      end

      context "with inputs of ['foo', 'bar']" do
        before { input.should_receive(:get).and_return('foo') }
        before { input2.should_receive(:get).and_return('bar') }

        describe "Processor.new :p, [input, input2]" do
          its(:run) {should == ['foo', 'bar'] }
        end

        describe "Processor.new(in: [input, input2]) { |x| x.inject(:+) }" do
          its(:run) {should == 'foobar' }
        end
      end
      specify "output?"
    end
  end
end