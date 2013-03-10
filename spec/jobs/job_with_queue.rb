class JobWithQueue
  def self.perform
    3 + 2
  end

  def self.queue
    :bar
  end
end
