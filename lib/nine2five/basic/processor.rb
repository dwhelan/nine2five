require 'agent'

module Nine2Five
  module Basic
    class Processor < Base

      def initialize(opts={}, &block)
        @input  = opts[:in]
        @output = opts[:out]
        @runner = opts[:runner]
        super
      end

      def start
        @runner.run do
          input = @input.receive
          output = @block ? @block.call(input) : input
          @output << output
        end
      end
    end
  end
end