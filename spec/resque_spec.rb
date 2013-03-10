require 'spec_helper'

require 'jobs/simple_job'
require 'jobs/job_with_arguments'

[Resque::InMemoryQueue, Resque::ThreadedQueue].each do |queue_implementation|
  describe "with #{queue_implementation}" do
    before do
      Resque.reset_singleton!
      Resque.queue_implementation = queue_implementation
    end

    describe "the queue" do
      it "executes later" do
        Resque.enqueue(SimpleJob)

        result = Resque.process_job
        
        expect(result).to eql(2)
      end

      it "can understand arguments" do
        Resque.enqueue(JobWithArugments, 5)

        result = Resque.process_job

        expect(result).to eql(6)
      end
    end
  end
end
