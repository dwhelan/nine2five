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
