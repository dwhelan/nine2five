require 'spec_helper'

module Nine2Five

  describe "DSL Examples" do

    before { initialize_workflow_map }
    subject { eval(parent_description(self)) }

    it "should allow a simple adder" do
      eval("
        channel name: :a, in: 1
        channel name: :b, in: 2
        channel name: :c
        processor(name: :adder, in: [:a, :b], out: :c) {|x| x.inject(:+)}"
      )

      adder = processors[:adder]
      result = channels[:c]
      result.should_receive(:<<).with(3)

      adder.run
    end
  end
end