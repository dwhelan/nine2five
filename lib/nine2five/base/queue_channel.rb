module Nine2Five
  module Base
    class QueueChannel

      def initialize
        @queue = Queue.new
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
