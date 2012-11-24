require 'nine2five'

def channel(*args, &block)
  channel = Nine2Five::Basic::Channel.new(*args, &block)
  Nine2Five::WorkflowMap.instance.add_channel channel
end

alias c channel

def processor(*args, &block)
  opts = args.last.is_a?(Hash) ? args.last : {}
  opts.each do |k,v|
    case k
      when :in, :out
        opts[k] = parse_channels(v)
    end
  end
  processor = Nine2Five::Basic::Processor.new(*args, &block)
  Nine2Five::WorkflowMap.instance.processors[processor.name] = processor
end

alias p processor

private

def parse_channels(channels)
  case channels
    when Symbol, String
      channels = Nine2Five::WorkflowMap.instance.channels[channels.to_sym]
    when Array
      channels = channels.map { |channel| parse_channels(channel) }
  end
  channels
end
