json.array!(@assembly_items) do |assembly_item|
  json.extract! assembly_item, :id, :item_code_id, :labor_cost, :material_cost, :percentage_used, :material_cost_ext
  json.url assembly_item_url(assembly_item, format: :json)
end
