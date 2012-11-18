module Nine2Five
  module Basic
    class Channel < Base

      def initialize(*args, &block)
        opts = args.last.is_a?(Hash) ? args.last : {}
        @initial = opts[:in]
        @value = @initial
        super
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