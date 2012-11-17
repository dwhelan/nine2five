require 'nine2five'

def channel(opts={})
  channel = Nine2Five::Basic::Channel.new(opts)
  Nine2Five::WorkflowMap.instance.add_channel channel
end

def processor(opts={})
  processor = Nine2Five::Basic::Processor.new(opts)
  #Nine2Five::WorkflowMap.instance.add_channel channel
end