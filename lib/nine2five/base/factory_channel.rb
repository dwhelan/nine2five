module Nine2Five
  module Base
    class FactoryChannel

      def initialize(output=nil, &block)
        @initial = output
        @output = output
        @block = block
      end

      def << obj
        @output = obj
      end

      def receive
        @output = @block.call(@output, @initial) if @block
        @output
      end
    end
  end
end
