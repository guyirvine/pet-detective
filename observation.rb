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

get '/observation/:id' do
  db = FluidDb::Db(ENV['DB'])
  list = db.queryForArray('SELECT id, app_key, mon_key, sent, received FROM observation_tbl WHERE id = ?', [params[:id]])
  db.close

  return list.to_json
end

get '/sensor/:id/:key' do
  db = FluidDb::Db(ENV['DB'])
  sql = '' \
        'SELECT o.app_key, o.mon_key, o.sent, o.received, ' \
        '       op.observation_id, op.key, op.value ' \
        'FROM observationpayload_tbl op ' \
        '       INNER JOIN observation_tbl o ON ( op.observation_id = o.id ) ' \
        '       INNER JOIN observation_tbl o_match ON ( ' \
        '         o_match.app_key = o.app_key AND o_match.mon_key = o.mon_key ) ' \
        'WHERE o_match.id = ? ' \
        'AND   op.key = ? ' \
        'ORDER BY o.sent DESC ' \
        ''

  p = [params[:id], params[:key]]
  list = db.queryForResultset(sql, p)
  db.close

  return list.to_json
end

get '/alertsfordisplay' do
  db = FluidDb::Db(ENV['DB'])
  sql = '' \
        'SELECT o.app_key, o.mon_key, a.sensor_key, count(*) AS count ' \
        'FROM observation_tbl o ' \
        '  INNER JOIN alert_tbl a ON ( o.id = a.observation_id ) ' \
        'WHERE a.clearedat IS NULL ' \
        'GROUP BY o.app_key, o.mon_key, a.sensor_key; ' \
        ''

  list = db.queryForResultset(sql, p)
  db.close

  return list.to_json
end

get '/alertsfordisplay/:id' do
  db = FluidDb::Db(ENV['DB'])
  sql = '' \
        'SELECT a.sensor_key ' \
        'FROM alert_tbl a ' \
        'WHERE a.clearedat IS NULL ' \
        'AND a.observation_id = ? ' \
        ''

  list = db.queryForResultset(sql, [ params[:id] ] )
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
