require 'spec_helper'

module Nine2Five

  describe "Channel DSL" do

    before { initialize_workflow_map }
    subject { eval description }

    describe "channel name: :c, in: 42" do
      its(:name)    { should be :c }
      its(:class)   { should be Basic::Channel }
      its(:>>) { should be 42 }
    end

    describe "channel name: :one; channel name: :two" do
      its(:name) { should be :two }
    end

    describe "c name: :c_should_be_an_alias_for_channel" do
      its(:name) { should be :c_should_be_an_alias_for_channel }
    end

    it "should save the channel hashed by its name" do
      c = eval("channel name: :c")

      channels.count.should be 1
      channels[:c].should be c
    end

  end
end