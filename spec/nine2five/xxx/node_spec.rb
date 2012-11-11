require "spec_helper"

module Nine2Five

  describe Node do

    let(:node) { Nine2Five::Node.new }
    let(:foo) { 'foo' }

    it "it should return input value if passed an empty block" do
      node.process(foo).should be foo
    end

    it "it should call block with input" do
      arg = nil

      node.process(foo){|a| arg=a;}
      arg.should be foo
    end

    it "it should return value from block" do
      bar = 'bar'

      node.process(foo){bar}.should be bar
    end

    it "it should default to a nil value" do
      node.process().should be nil
    end

    it "it should split" do
      node.process().should be nil
    end
  end
end