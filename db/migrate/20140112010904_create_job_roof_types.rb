class CreateJobRoofTypes < ActiveRecord::Migration
  def change
    create_table :job_roof_types do |t|
      t.integer :job_id
      t.integer :new_roof_type_id

      t.timestamps
    end
  end
end
