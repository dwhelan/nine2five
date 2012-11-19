require 'agent'

module Nine2Five

  module Basic

    class Base

      attr_reader :name

      def initialize(*args, &block)
        opts = args.last.is_a?(Hash) ? args.pop : {}
        @name = args.shift || opts[:name]
        @in  = args.shift || opts[:in]
        @block = block
        args
      end

    end
  end
end