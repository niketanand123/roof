json.array!(@item_codes) do |item_code|
  json.extract! item_code, :id, :item_code, :item_name, :uom, :item_cost, :material_cost, :material_w_tax, :labor_rate, :retail_price
  json.url item_code_url(item_code, format: :json)
end
