class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :address1
      t.string :city1
      t.string :state1
      t.string :zip1
      t.string :address2
      t.string :city2
      t.string :state2
      t.string :zip2
      t.string :gm_name
      t.string :gm_phone
      t.integer :sales_rep_id
      t.string :sales_rep_phone
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
