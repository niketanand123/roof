class CreateContactTypes < ActiveRecord::Migration
  def change
    create_table :contact_types do |t|
      t.string :contact_type

      t.timestamps
    end
  end
end
