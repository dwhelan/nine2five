require 'spec_helper'

module Nine2Five

  module Basic

    describe "Processor DSL" do

      describe "with just a name" do

        subject { eval('processor name: :a') }

        its(:name)    { should be :a }
        its(:class)   { should be Basic::Processor }
      end

      it "1 + 2 should equal 3" do
        pending "Adder"
        eval(%Q[
          channel   name: :a, value: 1
          channel   name: :b, value: 2
          processor name: :+, :a, :b, :c
        ])

      end
    end
  end
end