def response_json
  JSON.parse response.body
rescue
  fail 'JSON parse error on response.body'
end
