class CreateSalesTaxes < ActiveRecord::Migration
  def change
    create_table :sales_taxes do |t|
      t.decimal :sales_tax

      t.timestamps
    end
  end
end
