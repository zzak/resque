require 'redis'

class Resque
  class RedisQueue
    def initialize
      @queue = Redis.new
    end

    def pop
      @queue.blpop("default", :timeout => 0)[1]
    end

    def <<(stuff)
      @queue.rpush("default", stuff)
    end
  end
end
