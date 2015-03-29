require 'restclient'

payload = Hash['field1', 'A', 'field2', 'B']
hash = Hash['app-key', 2, 'mon-key', 2, 'sent', '2015-03-27', 'payload', payload]

RestClient.post 'http://localhost:4998/observation', hash.to_json, :content_type => :json, :accept => :json

