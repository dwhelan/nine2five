require 'agent'

class Processor

  def initialize(input, output, runner, &block)
    @input  = input
    @output = output
    @runner = runner
    @block  = block
  end

  def start
    @runner.run do
      input = @input.receive
      output = @block.call(input)
      @output << output
    end
  end
end