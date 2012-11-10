require "spec_helper"

describe FifoSelector do

  it "should select items in the order they were added" do
    subject.add 'foo'
    subject.add 'bar'

    subject.select().should == 'foo'
    subject.select().should == 'bar'
  end
end