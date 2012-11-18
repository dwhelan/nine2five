require 'agent'

module Nine2Five

  module Basic

    class Base

      attr_reader :name, :block

      def initialize(*args, &block)
        opts = args.last.is_a?(Hash) ? args.pop : {}
        first_arg = args.shift
        @name = opts[:name] || first_arg
        @block = block
        args
      end

    end
  end
end