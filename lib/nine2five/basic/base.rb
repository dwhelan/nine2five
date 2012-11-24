require 'agent'

module Nine2Five

  module Basic

    class Base

      attr_reader :name, :in, :out

      def initialize(*args, &block)
        opts   = args.last.is_a?(Hash) ? args.pop : {}
        @name  = args.shift || opts[:name]
        @in    = args.shift || opts[:in]
        @out   = args.shift || opts[:out]
        @value = @in
        @block = block
      end

      def process
        @value = self << transform(self.>>)
      end

      def >>
        @value
      end

      def transform input
        @block ? @block.call(input, @in) : input
      end

      def << output
        @output = output
      end

      def inspect
        "#{self.class.name.split('::').last} :#{@name}"
      end

    end
  end
end