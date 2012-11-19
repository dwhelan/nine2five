require "spec_helper"

module Nine2Five

  module Basic

    describe Channel do

      subject { eval(description(self)) }

      describe "initialization" do

        describe "Channel.new" do
          its(:name) { should be_nil}
        end

        describe "Channel.new :c" do
          its(:name) { should be :c}
        end

        describe "Channel.new name: :c" do
          its(:name) { should be :c}
        end

        describe "Channel.new :c1, name: :c2 # positional arg has precedence over named arg" do
          its(:name) { should be :c1}
        end
      end

      describe "get without a block" do

        describe "Channel.new" do
          its(:get) { should be_nil }
        end

        describe "Channel.new in:nil" do
          its(:get) { should be_nil }
        end

        describe "Channel.new in: 42" do
          its(:get) { should be 42 }
        end

        describe "Channel.new :c, 1, in: 2 # positional arg has precedence over named arg" do
          its(:get) { should be 1 }
        end

        describe "Channel.new in: [1, 2, 3]" do
          its(:get) { should == [1, 2, 3] }
        end
      end

      describe "get with a block" do

        describe "Channel.new(in: 42) { |x| x }" do
          its(:get) { should be 42 }
        end

        describe "Channel.new(in: 0) { |x| x + 1 } # last value passed to block" do
          specify "repeated gets should return: 1, 2, 3" do
            subject.get.should be 1
            subject.get.should be 2
            subject.get.should be 3
          end
        end

        describe "Channel.new(in: 1) { |x, initial| x + initial + 1 } # initial value passed to block" do
          specify "repeated gets should return: 3, 5, 7" do
            subject.get.should be 3
            subject.get.should be 5
            subject.get.should be 7
          end
        end
      end
    end
  end
end