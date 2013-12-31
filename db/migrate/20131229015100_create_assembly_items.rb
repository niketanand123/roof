class CreateAssemblyItems < ActiveRecord::Migration
  def change
    create_table :assembly_items do |t|
      t.integer :item_code_id
      t.float :labor_cost
      t.float :material_cost
      t.decimal :percentage_used
      t.float :material_cost_ext

      t.timestamps
    end
  end
end
