require "spec_helper"

module Nine2Five

  module Basic

    describe Processor do

      let(:input)   { "input" }
      let(:input2)  { "input2" }
      let(:output)  { "output" }
      let(:output2) { "output2" }

      before do
        input.stub(:get).and_return('foo')
        input2.stub(:get).and_return('bar')
      end

      subject { eval(description(self)) }

      describe "initialization" do

        describe "Processor.new :p, input, output" do
          its(:name) { should be :p}
          its(:in)   { should be input}
          its(:out)  { should be output}
        end

        describe "Processor.new :p" do
          its(:name) { should be :p}
        end

        describe "Processor.new :p1, name: :p2 # positional name has precedence over named arg" do
          its(:name) { should be :p1}
        end

        describe "Processor.new :p, input" do
          its(:in) { should be input}
        end

        describe "Processor.new :p, input, input: input2 # positional input has precedence over named arg" do
          its(:in) { should be input}
        end

        describe "Processor.new :p, input, output" do
          its(:out) { should be output}
        end

        describe "Processor.new :p, input, output, out: output2 # positional output has precedence over named arg" do
          its(:out) { should be output}
        end
      end

      describe "get" do

        context "with an input of 'foo'" do

          describe "Processor.new :p, input" do
            its(:get) {should == 'foo'}
          end

          describe "Processor.new :p, [input, input2] # should return array with get from each input channel" do
            its(:get) {should == ['foo', 'bar'] }
          end

        end
      end

      describe "transform" do

        describe "Processor.new :p, input # with no block" do
          it " transform should return value provided" do
            subject.transform('foo').should == 'foo'
          end
        end

        describe "Processor.new(:p, input) { |x| x + 'bar' } # with a block" do
          it "transform should return value returned from block" do
            subject.transform('foo').should == 'foobar'
          end
        end

      end

      describe "put" do
        let(:foo) {''}

        describe "Processor.new :p, input # with no output" do

          specify "put should return arg" do
            subject.put(foo).should be foo
          end

          specify "put should not raise an error" do
            lambda {subject.put(foo)}.should_not raise_error
          end
        end

        describe "Processor.new :p, input, output # with output" do
          before { output.should_receive(:put).with(foo) }
          specify "put should put arg to output" do
            subject.put(foo)
          end
        end

      end

      describe "Processor.new :p, input, output # with output # process should be get -> transform -> put" do
        let(:foo) {''}
        let(:bar) {''}
        let(:baz) {''}
        let(:qux) {''}

        before do
          subject.should_receive(:get).with(no_args).and_return(foo)
          subject.should_receive(:transform).with(foo).and_return(bar)
          subject.should_receive(:put).with(bar).and_return(qux)
        end

        its(:process) { should be qux }
      end
    end
  end
end