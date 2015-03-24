require 'rake/testtask'

task :push do
  `git push`
  `ssh dev.guyirvine.com "cd /guyirvine.com/pet-detective && git pull && sudo /sbin/stop pet-detective && ps ax | grep observation | head -n 1 | awk '{print $1}' | xargs kill && sudo /sbin/start pet-detective"`
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'Run tests'
task :default => :test
