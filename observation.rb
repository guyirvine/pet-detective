require 'sinatra'
require 'json'
require 'FluidDb'

before do
#  raise 'ENV[DB] needs to be a valid FluidDb uri' if ENV['DB'].nil?
end

get '/config.js' do
  Hash['db',ENV['DB']].to_json
end


post '/observation' do
  db = FluidDb::Db(ENV['DB'])

  request.body.rewind  # in case someone already read it
  data = JSON.parse request.body.read
  return 400 unless data.keys == ['app-key', 'mon-key', 'sent', 'payload']

  db.Begin
  sql = 'INSERT INTO observation_tbl( app_key, mon_key, sent ) VALUES ( ?, ?, ? )'
  params = [data['app-key'], data['mon-key'], data['sent']]
  db.execute(sql, params)
  id = db.queryForValue("SELECT CURRVAL( 'observation_seq' )")
  data['payload'].keys.each do |key|
    sql = 'INSERT INTO observationpayload_tbl( observation_id, key, value ) VALUES ( ?, ?, ? )'
    params = [id, key, data['payload']['key']]
    db.execute(sql, params)
  end
  db.Commit

  id.to_s
end
