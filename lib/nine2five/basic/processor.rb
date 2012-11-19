require 'agent'

module Nine2Five
  module Basic
    class Processor < Base

      attr_reader :in, :out

      def initialize(*args, &block)
        opts = args.last.is_a?(Hash) ? args.last : {}
        args = super
        @in  = args.shift || opts[:in]
        @out = args.shift || opts[:out]
      end

      def run
        input =  @in.kind_of?(Array) ? @in.map(&:get) : @in.get
        output = @block ? @block.call(input) : input
        @out << output if @out
        output
      end

      def inspect
        "processor :#{@name}"
      end

    end
  end
end