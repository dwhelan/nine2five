require 'spec_helper'

module Nine2Five

  describe "DSL Examples" do

    it "should enable a simple adder" do
      adder = eval("
        a = c in: 1
        b = c in: 2
        p(in: [a, b]) {|x| x.inject(:+)}"
      )

      adder.process.should be 3
    end

  end
end