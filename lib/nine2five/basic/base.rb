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
        if @value.is_a? Fixnum
          @value
        elsif @value && @value.respond_to?(:>>)
          @value.>>
        elsif @value.is_a? Array
          @value.shift
        else
          @value
        end
      end

      def transform input
        @block ? @block.call(input, @in) : input
      end

      def << output
        if @output.is_a? Fixnum
          @output = output
        elsif @output && @output.respond_to?(:<<)
          @output =  @output.<< output
        else
          @output = output
        end
      end

      def inspect
        "#{self.class.name.split('::').last} :#{@name}"
      end

    end
  end
end