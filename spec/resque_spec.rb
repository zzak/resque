require 'resque'

class SimpleJob
  def self.perform
    1 + 1
  end
end

class JobWithArugments
  def self.perform(num)
    1 + num
  end
end

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
