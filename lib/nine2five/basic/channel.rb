module Nine2Five
  module Basic
    class Channel < Base

      def initialize(*args)
        super
        @value = @in
      end

      def get
        @value = transform(@value, @in)
        #@value = @block ? @block.call(@value, @in) : @value
      end

      def put obj
        @output = obj
      end

      alias :<< :put

      def inspect
        "channel :#{@name}"
      end
    end
  end
end