require 'spec_helper'

module Nine2Five

  describe "Nine2Five DSL" do

    subject { eval('channel :a') }

    its(:name) {should be :a }
    its(:class) {should be Basic::QueueChannel }
  end
end
