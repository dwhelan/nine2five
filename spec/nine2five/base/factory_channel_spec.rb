require "spec_helper"

module Nine2Five

  module Base

    describe FactoryChannel do

      describe "initialization " do

        describe 'without a block' do

          it "receive should return object passed to initialize" do
            foo = ''
            factory = FactoryChannel.new(foo)
            factory.receive.should be foo
          end

          it "receive should default to creating nils" do
            factory = FactoryChannel.new
            factory.receive.should be nil
          end
        end

        describe 'with a block' do

          it "receive should initially receive object passed to initialize" do
            foo = ''
            factory = FactoryChannel.new(foo) { |x| x }
            factory.receive.should be foo
          end

          it "receive should use the last received object in call to block" do
            factory = FactoryChannel.new(0) { |x| x + 1 }
            factory.receive.should be 1
            factory.receive.should be 2
            factory.receive.should be 3
          end

          it "receive should pass object passed to initialize in call to block" do
            factory = FactoryChannel.new(1) { |x, initial| x + initial + 1 }
            factory.receive.should be 3
            factory.receive.should be 5
            factory.receive.should be 7
          end
        end
      end
      describe "send" do

        it "seeds the next received value" do
          foo = ''
          subject << foo
          subject.receive.should be foo
        end
      end
    end
  end
end