module Nine2Five
  class Node

    def process(object=nil)
      block_given? ? yield(object) : object
    end
  end
end