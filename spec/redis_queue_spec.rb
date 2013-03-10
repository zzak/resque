require 'resque/redis_queue'

# for stubbing purposes
class Redis
end

describe Resque::RedisQueue do
  it "can recall things from Redis" do
    redis = double
    redis.stub(:get).and_return('{"class":"Foo","args":["bar"]}')
    Redis.stub(:new => redis)

    rqueue = Resque::RedisQueue.new
    job = JSON.parse(rqueue.pop)
    
    expect(job['class']).to eql("Foo")
    expect(job['args']).to eql(["bar"])
  end
end
