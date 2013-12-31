json.array!(@assemblies) do |assembly|
  json.extract! assembly, :id, :master_item, :build_date, :item_description, :warranty_description, :wo_description, :proposal_description, :is_po, :is_wo, :unit_of_measurement, :total_material, :tax_rate_percentage, :total_tax, :total_labor, :total_cost, :markup_operator_percentage, :markup_total_amt, :total_price
  json.url assembly_url(assembly, format: :json)
end
