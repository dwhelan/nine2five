require "spec_helper"

module Nine2Five

  module Basic

    describe Channel do

      subject { eval(description(self)) }

      describe "initialization" do

        describe "Channel.new" do
          its(:name)    { should be nil}
          its(:receive) { should be nil}
          its(:block)   { should be nil}
        end

        describe "Channel.new :c" do
          its(:name) { should be :c}
        end

        describe "Channel.new name: :c" do
          its(:name) { should be :c}
        end

        describe "Channel.new :c1, name: :c2" do
          its(:name) { should be :c1}
        end

        describe "Channel.new :c, 0" do
          its(:receive) { should be 0}
        end

        describe "Channel.new :c, in: 0" do
          its(:receive) { should be 0}
        end

        describe "Channel.new :c, 1, in: 2" do
          its(:receive) { should be 1}
        end
      end

      describe "receive without a block" do

        describe "Channel.new" do
          subject {Channel.new }
          its(:receive) { should be nil }
        end

        describe "Channel.new(in: 42)" do
          its(:receive) { should be 42 }
        end
      end

      describe "receive with a block" do

        describe "Channel.new(in: 42) { |x| x }" do
          its(:receive) { should be 42 }
        end

        describe "Channel.new(in: 0) { |x| x + 1 }" do
          specify "repeated receives should return: 1, 2, 3" do
            subject.receive.should be 1
            subject.receive.should be 2
            subject.receive.should be 3
          end
        end

        describe "Channel.new(in: 1) { |x, initial| x + initial + 1 }" do
          specify "repeated receives should return: 3, 5, 7" do
            subject.receive.should be 3
            subject.receive.should be 5
            subject.receive.should be 7
          end
        end
      end
    end
  end
end