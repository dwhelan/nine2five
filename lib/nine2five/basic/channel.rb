module Nine2Five
  module Basic
    class Channel < Base

      def initialize(*args)
        super
        @value = @in
      end

      def << obj
        @output = obj
      end

      def get
        @value = @block ? @block.call(@value, @in) : @value
      end

      def inspect
        "channel :#{@name}"
      end
    end
  end
end