require 'resque/redis_queue'
require 'jobs/job_with_arguments'

# for stubbing purposes
class Redis
end

describe Resque::RedisQueue do
  it "can recall things from Redis" do
    redis = double
    redis.stub(:blpop).with("default", :timeout => 0).and_return(['default','{"class":"Foo","args":["bar"]}'])
    Redis.stub(:new => redis)

    rqueue = Resque::RedisQueue.new
    job = JSON.parse(rqueue.pop)
    
    expect(job['class']).to eql("Foo")
    expect(job['args']).to eql(["bar"])
  end

  it "can put things into Redis" do
    redis = double
    redis.should_receive(:rpush).with("default", '{"class":"JobWithArguments","args":[2]}')
    
    Redis.stub(:new => redis)

    resque = Resque.new
    resque.queue_implementation = Resque::RedisQueue
    
    resque.enqueue(JobWithArguments, 2)
  end
end
