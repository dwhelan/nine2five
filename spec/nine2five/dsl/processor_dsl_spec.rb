require 'spec_helper'

module Nine2Five

  describe "Processor DSL" do

    before  { initialize_workflow_map }
    subject { eval(parent_description(self)) }

    describe "processor name: :p" do
      its(:name)  { should be :p }
      its(:class) { should be Basic::Processor }
    end

    describe "p name: :p_should_be_an_alias_for_processor" do
      its(:name)    { should be :p_should_be_an_alias_for_processor }
    end

    describe "channel name: :a; channel name: :c; processor name: :x, in: :a, out: :c" do
      its(:in)  { subject.should be channels[:a] }
      its(:out) { subject.should be channels[:c] }
    end

    describe "channel name: :a; channel name: :b; channel name: :c; processor in: [:a, :b]" do
      its(:in) { should == [ channels[:a], channels[:b] ] }
    end


    it "should save the processor hashed by its name" do
      p = eval("processor name: :p")
      processors[:p].should be p
      processors.count.should be 1
    end
  end
end