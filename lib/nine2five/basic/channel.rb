module Nine2Five
  module Basic
    class Channel < Base

      def initialize(name, value=nil, opts={}, &block)
        @initial = value
        @value = value
        @block = block
        super(name, opts)
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
