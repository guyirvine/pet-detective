require 'rake/testtask'

desc "Get Prod Db"
task :getdb do
  `scp fp_x:/FarmPerformance/backup/pet-detective.sql ./sql`
end

task :push do
  `git push`
  `ssh dev.guyirvine.com "cd /guyirvine.com/pet-detective && git pull && ps ax | grep observation | grep -v su | head -n 1 | awk '{print $1}' | xargs kill"`
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'Run tests'
task :default => :test
