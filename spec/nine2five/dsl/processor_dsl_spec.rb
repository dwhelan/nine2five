require 'spec_helper'

module Nine2Five

  describe "Processor DSL" do

    subject { eval description }

    before do
      initialize_workflow_map
      eval("
        i1 = channel :i1
        i2 = channel :i2
        o1 = channel :o1
        o2 = channel :o2
      ")
    end

    describe "processor name: :p" do
      its(:name)  { should be :p }
      its(:class) { should be Basic::Processor }
    end

    it "should save the processor hashed by its name" do
      p = eval("processor name: :p")

      processors.count.should be 1
      processors[:p].should be p
    end

    describe "p # 'p' should be an alias for 'processor'" do
      its(:class) { should be Basic::Processor }
    end

    describe "inputs"  do

      describe "p in: :i1 # input channel as a symbol" do
        its(:in) { should == channels[:i1] }
      end

      describe "p in: 'i1' # input channel as a string" do
        its(:in) { should == channels[:i1] }
      end

      describe "ch1 = c :c; p in: ch1 # input channel explicitly" do
        its(:in) { should == channels[:c] }
      end

      describe "p in: [:i1, :i2] # input channel array as symbols" do
        its(:in) { should == [ channels[:i1], channels[:i2] ] }
      end

      describe "p in: ['i1', 'i2'] # input channel array as strings" do
        its(:in) { should == [ channels[:i1], channels[:i2] ] }
      end

      describe "ch1 = c :ch1; ch2 = c :ch2; p in: [ch1, ch2] # input channel array explicitly" do
        its(:in) { should == [ channels[:ch1], channels[:ch2] ] }
      end
    end

    describe "outputs"  do

      describe "p out: :o1 # output channel as a symbol" do
        its(:out) { should == channels[:o1] }
      end

      describe "p out: 'o1' # output channel as a string" do
        its(:out) { should == channels[:o1] }
      end

      describe "ch1 = c :c; p out: ch1 # output channel explicitly" do
        its(:out) { should == channels[:c] }
      end

      describe "p out: [:o1, :o2] # output channel array as symbols" do
        its(:out) { should == [ channels[:o1], channels[:o2] ] }
      end

      describe "p out: ['o1', 'o2'] # output channel array as strings" do
        its(:out) { should == [ channels[:o1], channels[:o2] ] }
      end

      describe "ch1 = c :ch1; ch2 = c :ch2; p out: [ch1, ch2] # output channel array explicitly" do
        its(:out) { should == [ channels[:ch1], channels[:ch2] ] }
      end
    end
  end
end