json.array!(@slaps) do |slap|
  json.extract! slap, :id, :text
  json.url slap_url(slap, format: :json)
end
