require 'agent'

module Nine2Five

  module Basic

    class Base

      attr_reader :name, :block

      def initialize(*args, &block)
        opts = args.last.is_a?(Hash) ? args.pop : {}
        @name = opts[:name] || args.shift
        @block = block
      end

    end
  end
end