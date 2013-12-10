class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.boolean :is_active
      t.boolean :is_admin

      t.timestamps
    end
  end
end
