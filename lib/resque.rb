require "resque/version"
require 'thread'

module Resque
  class Job
    def initialize(klass)
      @klass = klass
    end

    def do_later(meth)
      @meth = meth
    end

    def execute
      instance = @klass.new
      instance.send(@meth)
    end
  end

  def queue
    @queue ||= {:default => Queue.new}
  end
  module_function :queue
end

def Resque(klass, queue=:default)
  job = Resque::Job.new(klass)

  Resque.queue[queue] << job

  job
end
