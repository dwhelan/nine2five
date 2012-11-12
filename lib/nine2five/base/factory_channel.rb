module Nine2Five
  module Base
    class FactoryChannel

      def initialize(output=nil, &block)
        @output = output
        @block = block
      end

      #def << obj
      #  @queue << obj
      #end

      def receive
        @output = @block.call(@output) if @block
        @output
      end
    end
  end
end
