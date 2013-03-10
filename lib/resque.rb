require "resque/version"

require "resque/in_memory_queue"

class Resque
  def initialize(queue_class = InMemoryQueue)
    @queue_class = queue_class
  end

  def enqueue(klass)
    queue[:default] << [klass, []]
  end

  def queue
    @queue ||= {default:  @queue_class.new}
  end
end

require "resque/compatibility"
