require 'spec_helper'

module Nine2Five

  describe "DSL Examples" do

    before { initialize_workflow_map }

    it "should enable a simple adder" do
      adder = eval("
        a = c :a, 1
        b = c :b, 2
        sum = c :c
        p(:p, [a, b], sum) {|x| x.inject(:+)}"
      )

      adder.process.should be 3
    end

    it "should enable a simple adder" do
      pending 'blah'
      adder = eval("
        p(:p, [1, 2]) {|x| x.inject(:+)}"
      )

      adder.process.should be 3
    end



  end
end