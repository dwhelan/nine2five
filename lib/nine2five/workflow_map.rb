require 'singleton'

module Nine2Five

  class WorkflowMap

    include Singleton

    attr_reader :channels, :processors

    def initialize
      reset
    end

    def add_channel channel
      channels[channel.name] = channel
      channel
    end

    def reset
      @channels = {}
      @processors = {}
    end
  end
end
