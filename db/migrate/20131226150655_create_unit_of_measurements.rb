class CreateUnitOfMeasurements < ActiveRecord::Migration
  def change
    create_table :unit_of_measurements do |t|
      t.string :unit

      t.timestamps
    end
  end
end
