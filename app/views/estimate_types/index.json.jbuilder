json.array!(@estimate_types) do |estimate_type|
  json.extract! estimate_type, :id, :estimate_type, :default_overhead
  json.url estimate_type_url(estimate_type, format: :json)
end
