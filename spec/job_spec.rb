require 'spec_helper'

require 'jobs/simple_job'
require 'jobs/job_with_queue_ivar'
require 'jobs/job_with_queue'

describe "a job" do
  it "gets enqueued on the default queue" do
    resque = Resque.new
    resque.enqueue(SimpleJob)
    expect(resque.queue[:default].length).to be(1)
  end

  it "respects @queue" do
    resque = Resque.new
    resque.enqueue(JobWithQueueIvar)
    expect(resque.queue[:foo].length).to be(1)
  end

  it "respects #queue" do
    resque = Resque.new
    resque.enqueue(JobWithQueue)
    expect(resque.queue[:bar].length).to be(1)
  end
end
