require 'agent'

module Nine2Five

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
        output = @block ? @block.call(input) : input
        @output << output
      end
    end
  end
end