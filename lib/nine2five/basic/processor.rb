require 'agent'

module Nine2Five
  module Basic
    class Processor < Base

      attr_reader :in, :out, :runner

      def initialize(*args, &block)
        opts = args.last.is_a?(Hash) ? args.clone.pop : {}
        @in  = opts[:in]
        @out = opts[:out]
        @runner = opts[:runner]
        super
      end

      def start
        @runner.run do
          run
        end
      end

      def run
        if @in.kind_of?(Array)
          input = @in.map(&:receive)
        else
          input = @in.receive
        end
        output = @block ? @block.call(input) : input
        @out << output
      end
    end
  end
end