json.array!(@companies) do |company|
  json.extract! company, :id, :name, :address, :city, :state, :zip, :main_phone, :fax_number, :main_email, :website, :license
  json.url company_url(company, format: :json)
end
