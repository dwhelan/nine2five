require "spec_helper"

module Nine2Five

  module Base

    describe QueueChannel do
      let(:job) { 'job' }

      it "should operate as FIFO" do
        subject << 'j1'
        subject << 'j2'
        subject << 'j3'

        subject.receive.should == 'j1'
        subject.receive.should == 'j2'
        subject.receive.should == 'j3'
      end

      it "should be thread safe" do
        runner = Thread.new do
          subject << 'j1'
          subject << 'j2'
          subject << 'j3'
        end

        subject.receive.should == 'j1'
        subject.receive.should == 'j2'
        subject.receive.should == 'j3'

        runner.join
      end
    end
  end
end