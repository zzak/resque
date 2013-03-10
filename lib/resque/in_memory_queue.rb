class Resque
  class InMemoryQueue
    def initialize
      @queue = []
    end
    def pop
      @queue.pop
    end
    def <<(stuff)
      @queue << stuff
    end
    def length
      @queue.length
    end
  end
end
