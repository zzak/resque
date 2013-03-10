class JobWithQueueIvar
  @queue = :foo

  def self.perform
    3 + 2
  end
end
