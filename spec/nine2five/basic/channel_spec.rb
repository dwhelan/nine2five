require "spec_helper"

module Nine2Five

  module Basic

    describe Channel do

      let(:value) { 'foo'}

      describe 'without a block' do

        it "receive should return value passed to initialize" do
          factory = Channel.new(value: value)
          factory.receive.should be value
        end

        it "receive should default to creating nils" do
          factory = Channel.new
          factory.receive.should be nil
        end
      end

      describe 'with a block' do

        it "receive should pass initial value on first call to block" do
          factory = Channel.new(value: value) { |x| x }
          factory.receive.should be value
        end

        it "receive should pass the last received value to block" do
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