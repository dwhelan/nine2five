require 'agent'

module Nine2Five
  module Basic
    class Processor < Base

      def >>
        @in.kind_of?(Array) ? @in.map(&:>>) : @in.>>
      end

      def << output
        @out ? @out << output : output
      end

      def inspect
        "processor :#{@name}"
      end

    end
  end
end