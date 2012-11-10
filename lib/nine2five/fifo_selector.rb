class FifoSelector

  def initialize
    @fifo = []
  end

  def add(object)
    @fifo.push(object)
  end

  def select
    @fifo.shift
  end
end