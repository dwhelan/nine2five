module Nine2Five
  module Basic
    class Channel < Base

      def initialize(opts={}, &block)
        @initial = opts[:value]
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
    end
  end
end
