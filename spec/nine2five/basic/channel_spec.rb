require "spec_helper"

module Nine2Five

  module Basic

    describe Channel do

      let(:input1)   { Channel.new :input, in: 1 }
      let(:input2)   { Channel.new :input, in: 2 }
      let(:input3)   { Channel.new :input, in: 3 }
      #let(:input2)  { "input2" }
      #let(:output)  { "output" }
      #let(:output2) { "output2" }

      subject { eval description }

      describe "initialization" do

        describe "Channel.new" do
          its(:name) { should be_nil }
        end

        describe "Channel.new :c" do
          its(:name) { should be :c }
        end

        describe "Channel.new name: :c" do
          its(:name) { should be :c }
        end

        describe "Channel.new :c1, name: :c2 # positional name has precedence over named arg" do
          its(:name) { should be :c1 }
        end
      end

      describe ">> without a block" do

        describe "Channel.new" do
          its(:>>) { should be_nil }
        end

        describe "Channel.new in:nil" do
          its(:>>) { should be_nil }
        end

        describe "Channel.new in: 42" do
          its(:>>) { should be 42 }
        end

        describe "Channel.new :c, 1, in: 2 # positional input has precedence over named arg" do
          its(:>>) { should be 1 }
        end

        describe "Channel.new in: [1, 2, 3] # when the input is an array >> should return array elements in order" do
          specify "repeated >> calls should return: 1, 2, 3, nil" do
            subject.>>.should be 1
            subject.>>.should be 2
            subject.>>.should be 3
            subject.>>.should be_nil
          end
        end

        describe "Channel.new in: input1" do
          its(:>>) { should == 1 }
        end

      end

      describe ">> with a block" do

        describe "Channel.new(in: 42) { |x| x }" do
          its(:>>) { should be 42 }
        end

        describe "Channel.new(in: 0) { |x| x + 1 } # last value passed to block" do
          specify "repeated process should return: 1, 2, 3" do
            subject.process.should be 1
            subject.process.should be 2
            subject.process.should be 3
          end
        end

        describe "Channel.new(in: 1) { |x, initial| x + initial + 1 } # initial value passed to block" do
          specify "repeated gets should return: 3, 5, 7" do
            subject.process.should be 3
            subject.process.should be 5
            subject.process.should be 7
          end
        end
      end
    end
  end
end