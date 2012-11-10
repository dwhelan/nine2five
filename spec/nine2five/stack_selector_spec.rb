require "spec_helper"

describe StackSelector do

  before do
  end

  it "should select items in the reverse order in which they were added" do
    subject.add 'foo'
    subject.add 'bar'

    subject.select().should == 'bar'
    subject.select().should == 'foo'
  end
end