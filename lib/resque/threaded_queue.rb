require 'thread'

class Resque
  class ThreadedQueue
    def initialize
      @queue = ::Queue.new
    end

    def pop
      @queue.pop
    end

    def <<(stuff)
      @queue << stuff
    end
  end
end
