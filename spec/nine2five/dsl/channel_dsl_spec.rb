require 'spec_helper'

module Nine2Five

  describe "Channel DSL" do

    before { WorkflowMap.instance.reset }
    subject { eval(parent_description(self)) }

    describe "channel name: :c, in: 42" do
      its(:name)    { should be :c }
      its(:class)   { should be Basic::Channel }
      its(:receive) { should be 42 }
    end

    describe "channel name: :one; channel name: :two" do
      its(:name)    { should be :two }
    end

    it "should save the channel hashed by its name" do
      c = eval("channel name: :c")
      channels[:c].should be c
      channels.count.should be 1
    end

  end
end