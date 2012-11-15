require "spec_helper"

module Nine2Five

  module Basic

    describe Channel do

      describe "initialization " do

        describe 'without a block' do

          it "receive should return value passed to initialize" do
            foo = ''
            factory = Channel.new('name', foo)
            factory.receive.should be foo
          end

          it "receive should default to creating nils" do
            factory = Channel.new('name')
            factory.receive.should be nil
          end
        end

        describe 'with a block' do

          it "receive should initially receive value passed to initialize" do
            foo = ''
            factory = Channel.new('name', foo) { |x| x }
            factory.receive.should be foo
          end

          it "receive should use the last received value in call to block" do
            factory = Channel.new('name', 0) { |x| x + 1 }
            factory.receive.should be 1
            factory.receive.should be 2
            factory.receive.should be 3
          end

          it "receive should pass value passed to initialize in call to block" do
            factory = Channel.new('name', 1) { |x, initial| x + initial + 1 }
            factory.receive.should be 3
            factory.receive.should be 5
            factory.receive.should be 7
          end
        end
      end
    end
  end
end