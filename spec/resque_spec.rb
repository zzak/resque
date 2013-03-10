require 'resque'

class SampleJob
  def self.perform
    1 + 1
  end
end

describe "a job" do
  it "executes later" do
    Resque.enqueue(SampleJob)

    klass, args = Resque.queue[:default].pop
    result = klass.perform(*args)
    
    expect(result).to eql(2)
  end
end
