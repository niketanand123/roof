class CreateJobCallNotes < ActiveRecord::Migration
  def change
    create_table :job_call_notes do |t|
      t.integer :job_site_id
      t.string :call_date
      t.string :call_time
      t.string :call_notes
      t.integer :employee_id

      t.timestamps
    end
  end
end
