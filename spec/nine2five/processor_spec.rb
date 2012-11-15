require "spec_helper"

module Nine2Five
  describe Processor do

    let(:input)  { Object.new }
    let(:output) { Object.new }
    let(:runner) { Object.new }

    before do
      input.should_receive(:receive).and_return('foo')
      runner.should_receive(:run).and_yield()
    end

    context "with a block" do
      subject { Processor.new(input, output, runner) { |x| x + 'bar'} }

      it "should process input through a block and output" do
        output.should_receive(:<<).with('foobar')
        subject.start
      end
    end

    context "without a block" do
      subject { Processor.new(input, output, runner)   }

      it "should pass input straight through to output if no block is provided" do
        output.should_receive(:<<).with('foo')
        subject.start
      end
    end

  end
end