class CreateAssemblies < ActiveRecord::Migration
  def change
    create_table :assemblies do |t|
      t.string :master_item
      t.date :build_date
      t.string :item_description
      t.string :warranty_description
      t.string :wo_description
      t.string :proposal_description
      t.boolean :is_po
      t.boolean :is_wo
      t.string :unit_of_measurement
      t.decimal :total_material
      t.decimal :tax_rate_percentage
      t.decimal :total_tax
      t.decimal :total_labor
      t.decimal :total_cost
      t.decimal :markup_operator_percentage
      t.decimal :markup_total_amt
      t.decimal :total_price

      t.timestamps
    end
  end
end
