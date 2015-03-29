require 'rake/testtask'

desc "Get Prod Db"
task :getdb do
  `ssh fp_x "pg_dump > /home/guirv0/tmp/reproduction_ro.sql"`
  `scp guirv0@galvatron:/home/guirv0/tmp/reproduction_ro.sql ./sql/`
  `ssh guirv0@galvatron "rm /home/guirv0/tmp/reproduction_ro.sql"`
  `psql -c 'DROP SCHEMA reproduction_ro CASCADE' fp`
  `psql -f ./sql/reproduction_ro.sql fp`
  `rm ./sql/reproduction_ro.sql`
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
