require 'agent'

module Nine2Five
  module Basic
    class Processor < Base

      attr_reader :in, :out

      def initialize(*args)
        opts = args.last.is_a?(Hash) ? args.last : {}
        args = super
        @out = args.shift || opts[:out]
      end

      def process
        put(transform(get))
      end

      def get
        @in.kind_of?(Array) ? @in.map(&:get) : @in.get
      end

      def put(output)
        @out ? @out.put(output) : output
      end

      alias :complete :put
      alias :create :put
      alias :<< :put

      def inspect
        "processor :#{@name}"
      end

    end
  end
end