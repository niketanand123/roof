json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :last_name, :address, :city, :state, :zip, :phone, :is_active, :is_admin
  json.url employee_url(employee, format: :json)
end
