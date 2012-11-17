require 'spec_helper'

module Nine2Five

  describe "Channel DSL" do

    describe "basic channel" do

      describe "should create channel with name" do

        subject { eval('channel name: :a') }

        its(:name)    { should be :a }
        its(:class)   { should be Basic::Channel }
        its(:receive) { should be nil }
      end

      describe "should create a constant value channel" do
        subject { eval('channel name: :a, value: 42') }

        its(:receive) { should be 42 }
      end

      describe "should create a constant value channel" do
        subject { eval('channel name: :a, value: 42') }

        its(:receive) { should be 42 }
      end

      describe "should return last channel created" do
        subject { eval('channel name: :a, value: 1;channel name: :b, value: 2') }

        its(:receive) { should be 2 }
      end
    end
  end
end