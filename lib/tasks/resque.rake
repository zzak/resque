namespace :resque do
  desc "work a queue"
  task :work do
    ENV['QUEUE'] ||= "default"
    system("resque work --queue=#{ENV['QUEUE']}")
  end
end
