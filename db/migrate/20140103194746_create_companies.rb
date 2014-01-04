class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :main_phone
      t.string :fax_number
      t.string :main_email
      t.string :website
      t.string :license

      t.timestamps
    end
  end
end
