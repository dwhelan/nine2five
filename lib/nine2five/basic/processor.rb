require 'agent'

module Nine2Five
  module Basic
    class Processor < Base

      attr_reader :in, :out, :runner

      def initialize(opts={}, &block)
        @in  = opts[:in]
        @out = opts[:out]
        @runner = opts[:runner]
        super
      end

      def start
        @runner.run do
          input = @in.receive
          output = @block ? @block.call(input) : input
          @out << output
        end
      end
    end
  end
end