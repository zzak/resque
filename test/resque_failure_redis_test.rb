require 'test_helper'
require 'resque/failure/redis'

describe Resque::Failure::Redis do
  let(:bad_string)    { [39, 250, 141, 168, 138, 191, 52, 211, 159, 86, 93, 95, 39].map { |c| c.chr }.join }
  let(:exception)     { StandardError.exception(bad_string) }
  let(:worker)        { Resque::Worker.new(:test) }
  let(:queue)         { "queue" }
  let(:payload)       { { "class" => Object, "args" => 3 } }
  let(:redis_backend) { Resque::Failure::Redis.new(exception, worker, queue, payload) }

  it 'cleans up bad strings before saving the failure, in order to prevent errors on the resque UI' do
    # test assumption: the bad string should not be able to round trip though JSON
    assert_raises(MultiJson::DecodeError) {
      MultiJson.decode(MultiJson.encode(bad_string))
    }

    redis_backend.save
    Resque::Failure::Redis.all # should not raise an error
  end
end
