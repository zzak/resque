require 'redis'

class Resque
  class RedisQueue
    def initialize
      @queue = Redis.new
    end

    def pop
      @queue.blpop("default")[1]
    end

    def <<(stuff)
      @queue.rpush("default", stuff)
    end

    def length
      @queue.length
    end
  end
end
