require 'sinatra'
require 'json'
require 'FluidDb'

before do
#  raise 'ENV[DB] needs to be a valid FluidDb uri' if ENV['DB'].nil?
end

get '/config.js' do
  Hash['db', ENV['DB']].to_json
end

get '/apps' do
  db = FluidDb::Db(ENV['DB'])
  list = db.queryForResultset('SELECT DISTINCT app_key observation_tbl')
  db.close

  return list.to_json
end

get '/lastcontact' do
  db = FluidDb::Db(ENV['DB'])
  list = db.queryForResultset('SELECT DISTINCT ON ( app_key, mon_key ) app_key, mon_key, received, id FROM observation_tbl ORDER BY app_key, mon_key, received DESC')
  db.close

  return list.to_json
end

get '/observationpayload/:id' do
  db = FluidDb::Db(ENV['DB'])
  list = db.queryForResultset('SELECT id, observation_id, key, value FROM observationpayload_tbl WHERE observation_id = ?', [params[:id]])
  db.close

  return list.to_json
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
    params = [id, key, data['payload'][key]]
    db.execute(sql, params)
  end
  db.Commit

  db.close

  id.to_s
end
