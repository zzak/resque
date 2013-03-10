class Resque
  @singleton = new

  def self.enqueue(klass)
    @singleton.enqueue(klass)
  end

  def self.queue
    @singleton.queue
  end
end
