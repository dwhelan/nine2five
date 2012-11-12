require "spec_helper"

module Nine2Five

  module Base

    describe FactoryChannel do

      describe 'without a block' do

        it "receive should return object passed to initialize" do
          foo = 'foo'
          factory = FactoryChannel.new(foo)
          factory.receive().should be foo
        end

        it "receive should default to creating nils" do
          factory = FactoryChannel.new
          factory.receive().should be nil
        end
      end

      describe 'with a block' do

        it "receive should initially receive object passed to initialize" do
          factory = FactoryChannel.new(0) { |x| x + 1}
          factory.receive().should be 1
        end

        it "receive should use the last received object in call to block" do
          factory = FactoryChannel.new(0) { |x| x + 1}
          factory.receive()
          factory.receive().should be 2
          factory.receive().should be 3
        end
      end
    end
  end
end