json.array!(@sales_people) do |sales_person|
  json.extract! sales_person, :id, :first_name, :last_name
  json.url sales_person_url(sales_person, format: :json)
end
