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
        if v.kind_of?(Array)
          v = v.map{|name| Nine2Five::WorkflowMap.instance.channels[name]}
        else
          v = Nine2Five::WorkflowMap.instance.channels[v]
        end
    end
    opts[k] = v
  end
  processor = Nine2Five::Basic::Processor.new(*args, &block)
  Nine2Five::WorkflowMap.instance.processors[processor.name] = processor
end

alias p processor