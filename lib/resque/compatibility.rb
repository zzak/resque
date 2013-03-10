class Resque
  @singleton = new
 
  # just for testing
  def self.reset_singleton!
    @singleton = new
  end

  def self.method_missing(f, *args, &blk)
    @singleton.send(f, *args, &blk)
  end
end
