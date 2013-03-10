require "resque/version"

class Resque
  class Queue
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

  def self.enqueue(klass)
    queue[:default] << [klass, []]
  end

  def self.queue
    @queue ||= {default:  Queue.new}
  end
end
