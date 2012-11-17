require "spec_helper"

module Nine2Five

  module Basic

    describe Processor do

      let(:input)  { Object.new }
      let(:input2)  { Object.new }
      let(:output) { Object.new }
      let(:runner) { Object.new }

      describe "attributes" do
        let(:block)  { Proc.new { } }

        subject { Processor.new({name: :p, in: input, out: output, runner: runner}, &block)  }

        its(:name)   { should be :p}
        its(:in)     { should be input}
        its(:out)    { should be output}
        its(:runner) { should be runner}
        its(:block)  { should be block}
      end

      context "running" do

        before do
          runner.should_receive(:run).and_yield()
          input.should_receive(:receive).and_return('foo')
        end

        context "with a block" do
          subject { Processor.new(in: input, out: output, runner: runner) { |x| x + 'bar' }  }

          it "should process input through the block" do
            output.should_receive(:<<).with('foobar')
            subject.start
          end
        end

        context "without a block" do
          subject { Processor.new(in: input, out: output, runner: runner)   }

          it "should pass input straight through to output" do
            output.should_receive(:<<).with('foo')
            subject.start
          end
        end

        context "with multiple inputs and no block" do
          before  { input2.should_receive(:receive).and_return('bar') }
          subject { Processor.new(in: [input, input2], out: output, runner: runner) }

          it "should combine inputs into an array" do
            output.should_receive(:<<).with(['foo', 'bar'])
            subject.start
          end
        end

        context "with multiple inputs and a block" do
          before  { input2.should_receive(:receive).and_return('bar') }
          subject { Processor.new(in: [input, input2], out: output, runner: runner) { |x| x.inject(:+) }  }

          it "should apply the block to the input array" do
            output.should_receive(:<<).with('foobar')
            subject.start
          end
        end
      end
    end
  end
end