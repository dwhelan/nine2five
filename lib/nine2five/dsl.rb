require 'nine2five'

def channel(opts={})
  channel = Nine2Five::Basic::Channel.new(opts)
  Nine2Five::WorkflowMap.instance.add_channel channel
end

def processor(opts={})
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
  processor = Nine2Five::Basic::Processor.new(opts)
  Nine2Five::WorkflowMap.instance.processors[processor.name] = processor
end