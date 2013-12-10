json.array!(@roof_types) do |roof_type|
  json.extract! roof_type, :id, :roof_type
  json.url roof_type_url(roof_type, format: :json)
end
