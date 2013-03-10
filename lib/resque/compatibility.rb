class Resque
  @singleton = new
 
  # just for testing
  def self.reset_singleton!
    @singleton = new
  end

  def self.enqueue(klass, *args)
    @singleton.enqueue(klass, *args)
  end

  def self.queue
    @singleton.queue
  end

  def self.process_job(queue=:default)
    @singleton.process_job(queue)
  end

  def self.queue_implementation=(impl)
    @singleton.queue_implementation = impl
  end
end
