require 'resque'

class SampleJob
  def some_method
    1 + 1
  end
end

describe "a job" do
  it "executes later" do
    Resque(SampleJob).do_later(:some_method)

    result = Resque.queue[:default].pop.execute
    
    expect(result).to eql(2)
  end
end
