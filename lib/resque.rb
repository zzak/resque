require "resque/version"

require "resque/in_memory_queue"
require "resque/threaded_queue"

class Resque
  def initialize(queue_class = InMemoryQueue)
    @queue_class = queue_class
  end

  def enqueue(klass, *args)
    queue[:default] << [klass, args]
  end

  def queue
    @queue ||= Hash.new(@queue_class.new)
  end

  def queue_implementation=(impl)
    @queue_class = impl
  end
  
  def process_job(queue_name=:default)
    klass, args = Resque.queue[queue_name].pop
    klass.perform(*args)
  end
end

require "resque/compatibility"
