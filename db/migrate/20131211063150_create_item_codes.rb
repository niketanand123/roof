class CreateItemCodes < ActiveRecord::Migration
  def change
    create_table :item_codes do |t|
      t.string :item_code
      t.string :item_name
      t.string :uom
      t.decimal :item_cost
      t.decimal :material_cost
      t.decimal :material_w_tax
      t.decimal :labor_rate
      t.decimal :retail_price

      t.timestamps
    end
  end
end
