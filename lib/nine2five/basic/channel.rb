module Nine2Five
  module Basic
    class Channel < Base

      def initialize(opts={}, &block)
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
        "Channel :#{@name}"
      end
    end
  end
end
