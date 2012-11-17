require 'agent'

module Nine2Five

  module Basic

    class Base

      attr_reader :name

      def initialize(opts, &block)
        @name = opts[:name]
        @block = block
      end

    end
  end
end