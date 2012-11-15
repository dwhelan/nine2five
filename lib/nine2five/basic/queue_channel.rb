require 'nine2five/basic/base'

module Nine2Five
  module Basic
    class QueueChannel < Base

      def initialize(name, opts={})
        @queue = Queue.new
        super
      end

      def << obj
        @queue << obj
      end

      def receive
        @queue.deq
      end
    end
  end
end
