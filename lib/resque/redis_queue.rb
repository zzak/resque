require 'redis'

class Resque
  class RedisQueue
    def initialize
      @queue = Redis.new
    end

    def pop
      @queue.get
    end

    def <<(stuff)
      @queue << stuff
    end

    def length
      @queue.length
    end
  end
end
