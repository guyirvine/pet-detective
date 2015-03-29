#!/usr/bin/ruby

require 'beanstalk-client'
require 'rest-client'

if File.exists?( '/etc/pet-detective/config.rb' )
  require '/etc/pet-detective/config' 
end

app_key = `hostname`.chomp!
if !ENV['APP_KEY'].nil? then
  app_key = ENV['APP_KEY']
elsif defined? APP_KEY then
  app_key = APP_KEY
end

beanstalk_host = 'localhost:11300'
if !ENV['BEANSTALK_HOST'].nil? then
  beanstalk_host = ENV['BEANSTALK_HOST']
elsif defined? BEANSTALK_HOST then
  beanstalk_host = BEANSTALK_HOST
end

if !ENV['BASE_URL'].nil? then
  base_url = ENV['BASE_URL']
elsif !BASE_URL.nil? then
  base_url = BASE_URL
end

monitor_key = 'beanstalk'

beanstalk = Beanstalk::Pool.new([beanstalk_host])

payload = Hash[]
beanstalk.list_tubes[beanstalk_host].each do |name|
        tubeStats = beanstalk.stats_tube(name)
        payload[name] = tubeStats['current-jobs-ready'].to_s
end

hash = Hash['app-key', app_key, 'mon-key', monitor_key, 'sent', Time.now.to_s, 'payload', payload]

RestClient.post "#{base_url}/observation", hash.to_json, :content_type => :json, :accept => :json


