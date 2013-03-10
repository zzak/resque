require 'spec_helper'

[Resque::InMemoryQueue, Resque::ThreadedQueue].each do |queue_implementation|
  describe "with #{queue_implementation}" do
    before do
      Resque.reset_singleton!
      Resque.queue_implementation = queue_implementation
    end

    describe "a job" do
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
