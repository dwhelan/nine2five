require "spec_helper"

module Nine2Five

  module Basic

    describe Channel do

      let(:value) { 'foo'}

      describe "without a block" do

        context "with an initial value of 42" do
          subject {Channel.new(value: 42) }
          its(:receive) { should be 42 }
        end

        context "with no initial value" do
          subject {Channel.new }
          its(:receive) { should be nil }
        end
      end

      describe "with a block" do

        describe "with an initial value of 42 and an identity block" do
          subject { Channel.new(value: 42) { |x| x } }
          its(:receive) { should be 42 }
        end

        it "with a block that increments, each receive call should return a value one greater than the last" do
          factory = Channel.new(value: 0) { |x| x + 1 }
          factory.receive.should be 1
          factory.receive.should be 2
          factory.receive.should be 3
        end

        it "receive should pass initial value to block as second parameter" do
          factory = Channel.new(value: 1) { |x, initial| x + initial + 1 }
          factory.receive.should be 3
          factory.receive.should be 5
          factory.receive.should be 7
        end
      end
    end
  end
end