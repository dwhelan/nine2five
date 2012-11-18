module Nine2Five
  module Basic
    class Channel < Base

      def initialize(*args, &block)
        opts = args.last.is_a?(Hash) ? args.last : {}
        args = super
        @initial = opts[:in] || args.shift
        @value = @initial
      end

      def << obj
        @output = obj
      end

      def receive
        @value = @block.call(@value, @initial) if @block
        @value
      end

      def inspect
        "channel :#{@name}"
      end
    end
  end
end