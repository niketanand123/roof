json.array!(@lead_sources) do |lead_source|
  json.extract! lead_source, :id, :source
  json.url lead_source_url(lead_source, format: :json)
end
