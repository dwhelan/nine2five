require 'spec_helper'

module Nine2Five

  describe "Processor DSL" do

    subject { eval description }

    before  { initialize_workflow_map }

    describe "processor name: :p" do
      its(:name)  { should be :p }
      its(:class) { should be Basic::Processor }
    end

    describe "p # 'p' should be an alias for 'processor'" do
      its(:class) { should be Basic::Processor }
    end

    describe "p :p, in: :in, out: :out" do
      before { eval("c :in; c :out") }
      its(:name) { should be :p }
      its(:in)   { should be channels[:in] }
      its(:out)  { should be channels[:out] }
    end

    describe "p in: 'c' # channel can be referenced as strings" do
      before { eval("c :c") }
      its(:in) { should == channels[:c] }
    end

    describe "ch = c :c; p in: ch # channels can be referenced explicitly" do
      its(:in) { should == channels[:c] }
    end

    describe "p in: [:in1, :in2] # input array as symbols" do
      before { eval("c :in1; c :in2") }
      its(:in) { should == [ channels[:in1], channels[:in2] ] }
    end

    describe "p in: ['in1', 'in2'] # input array as strings" do
      pending "getting arrays working better"
      before { eval("c :in1; c :in2") }
      # its(:in) { should == [ channels[:in1], channels[:in2] ] }
    end

    it "should save the processor hashed by its name" do
      p = eval("processor name: :p")

      processors.count.should be 1
      processors[:p].should be p
    end
  end
end