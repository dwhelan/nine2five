require 'singleton'

module Nine2Five

  class WorkflowMap

    attr_reader :channels

    include Singleton

    def initialize
      @channels = []
    end

    def add_channel channel
      channels << channel
      channel
    end

  end
end

def channel(name, opts={})
  channel = Nine2Five::Basic::QueueChannel.new(name, opts)
  Nine2Five::WorkflowMap.instance.add_channel channel
end