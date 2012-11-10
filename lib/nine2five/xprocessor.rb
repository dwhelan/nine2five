class Processor

  attr_accessor :selector, :worker, :router

  def process
    selection = @selector.select
    result = worker.work(selection)
    router.route(result)
  end
end