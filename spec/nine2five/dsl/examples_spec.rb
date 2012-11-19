require 'spec_helper'

module Nine2Five

  describe "DSL Examples" do

    before { initialize_workflow_map }
    subject { eval(description(self)) }

    it "should allow a simple adder" do
      adder = eval("
        c :a, 1
        c :b, 2
        c :c
        p(in: [:a, :b], out: :c) {|x| x.inject(:+)}"
      )

      adder.process.should be 3
    end
  end
end