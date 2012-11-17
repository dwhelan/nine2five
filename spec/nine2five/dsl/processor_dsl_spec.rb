require 'spec_helper'

module Nine2Five

  describe "Processor DSL" do

    before  { WorkflowMap.instance.reset }
    subject { eval(parent_description(self)) }

    describe "processor name: :p" do
      its(:name)  { should be :p }
      its(:class) { should be Basic::Processor }
    end

    describe "channel name: :a; channel name: :c; processor name: :x, in: :a, out: :c" do
      its(:in)  { subject.should be channels[:a] }
      its(:out) { subject.should be channels[:c] }
    end

    it "1 + 2 should equal 3" do
      pending "Adder"
      eval(%Q[
        channel   name: :a, value: 1
        channel   name: :b, value: 2
        processor name: :+, :a, :b, :c
      ])

    end

    it "should save the processor hashed by its name" do
      p = eval("processor name: :p")
      processors[:p].should be p
      processors.count.should be 1
    end
  end
end