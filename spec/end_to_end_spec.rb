require 'resque'
require 'jobs/job_with_arguments'

describe do
  it "mock end-to-ends" do
    json = '{"class":"JobWithArguments","args":[24]}'
    redis = double
    redis.stub(:blpop).with("default").and_return(["default", json])
    redis.should_receive(:rpush).with("default", json)
    Redis.stub(:new => redis)

    resque = Resque.new
    resque.queue_implementation = Resque::RedisQueue

    resque.enqueue(JobWithArguments, 24)
    result = resque.process_job

    expect(result).to be(25)
  end

  it "forreals end-to-ends" do
    resque = Resque.new(Resque::RedisQueue)

    resque.enqueue(JobWithArguments, 41)
    result = resque.process_job

    expect(result).to be(42)
  end
end
