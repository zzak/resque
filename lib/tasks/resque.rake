namespace :resque do
  desc "work a queue"
  task :work do
    system("resque")
  end
end
