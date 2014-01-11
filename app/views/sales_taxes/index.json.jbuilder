json.array!(@sales_taxes) do |sales_tax|
  json.extract! sales_tax, :id, :sales_tax
  json.url sales_tax_url(sales_tax, format: :json)
end
