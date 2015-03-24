require 'test/unit'
require 'rack/test'
require 'json'
require './observation'

ENV['RACK_ENV'] = 'test'

class ObservationTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def setup
    ENV['DB'] = 'pgsql://girvine:coffee11@localhost/pet-detective'
  end

  def test_smoke
    hash = Hash['app_key', 1]

    post '/observation', hash.to_json
  end

  def test_post_incomplete
    hash = Hash['app-key', 1]

    post '/observation', hash.to_json
    assert last_response.status == 400
  end

  def test_post
    payload = Hash['field1', 'A', 'field2', 'B']
    hash = Hash['app-key', 1, 'mon-key', 2, 'sent', '2015-03-27', 'payload', payload]

    db = FluidDb::Db(ENV['DB'])
    ob_count = db.queryForValue('SELECT count(*) FROM observation_tbl').to_i
    obpld_count = db.queryForValue('SELECT count(*) FROM observationpayload_tbl').to_i

    post '/observation', hash.to_json
    assert last_response.ok?
    assert (ob_count + 1) == db.queryForValue('SELECT count(*) FROM observation_tbl').to_i
    assert (obpld_count + 2) == db.queryForValue('SELECT count(*) FROM observationpayload_tbl').to_i
    assert '2' == db.queryForValue('SELECT mon_key FROM observation_tbl WHERE id = ?', [last_response.body])
  end
end
