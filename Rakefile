require 'rake/testtask'

task :push do
  `git push`
  `ssh dev.guyirvine.com "cd /guyirvine.com/pet-detective && git pull && sudo /sbin/restart pet-detective"`
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'Run tests'
task :default => :test
