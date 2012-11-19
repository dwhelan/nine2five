module Nine2Five
  module Basic
    class Channel < Base

      def initialize(*args, &block)
        opts = args.last.is_a?(Hash) ? args.last : {}
        args = super
        @initial = args.shift || opts[:in]
        @value = @initial
      end

      def << obj
        @output = obj
      end

      def get
        @value = @block.call(@value, @initial) if @block
        @value
      end

      alias :receive :get

      def inspect
        "channel :#{@name}"
      end
    end
  end
end