json.array!(@unit_of_measurements) do |unit_of_measurement|
  json.extract! unit_of_measurement, :id, :unit
  json.url unit_of_measurement_url(unit_of_measurement, format: :json)
end
