class StackSelector

  def initialize
    @fifo = []
  end

  def add(object)
    @fifo.push(object)
  end

  def select
    @fifo.pop
  end
end