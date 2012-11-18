require 'agent'

module Nine2Five
  module Basic
    class Processor < Base

      attr_reader :in, :out

      def initialize(*args, &block)
        opts = args.last.is_a?(Hash) ? args.last : {}
        @in  = opts[:in]
        @out = opts[:out]
        super
      end

      def run
        input =  @in.kind_of?(Array) ? @in.map(&:receive) : @in.receive
        output = @block ? @block.call(input) : input
        @out << output
      end

      def inspect
        "processor :#{@name}"
      end

    end
  end
end