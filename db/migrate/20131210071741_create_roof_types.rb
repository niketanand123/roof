class CreateRoofTypes < ActiveRecord::Migration
  def change
    create_table :roof_types do |t|
      t.string :roof_type

      t.timestamps
    end
  end
end
