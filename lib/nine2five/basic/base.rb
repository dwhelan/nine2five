require 'agent'

module Nine2Five

  module Basic

    class Base

      attr_reader :name

      def initialize(name, opts)
        @name = name
      end

    end
  end
end