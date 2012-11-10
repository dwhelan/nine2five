require "spec_helper"

describe Processor do

  let(:input)  { Object.new }
  let(:output) { Object.new }
  let(:runner) { Object.new }

  subject { Processor.new(input, output, runner) { |v| v + 'bar'} }

  it "should make a selection via its selector" do
    input.should_receive(:receive).and_return('foo')
    runner.should_receive(:run).and_yield()
    output.should_receive(:<<).with('foobar')

    subject.start

  end
end