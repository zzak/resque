require "resque/version"

require "resque/in_memory_queue"

class Resque
  def self.enqueue(klass)
    queue[:default] << [klass, []]
  end

  def self.queue
    @queue ||= {default:  InMemoryQueue.new}
  end
end
