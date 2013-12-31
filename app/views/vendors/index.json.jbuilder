json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :name, :address1, :city1, :street1, :zip1, :address2, :city2, :street2, :zip2, :gm_name, :gm_phone, :sales_rep_id, :sales_rep_phone, :email, :website
  json.url vendor_url(vendor, format: :json)
end
