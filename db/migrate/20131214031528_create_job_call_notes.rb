class CreateJobCallNotes < ActiveRecord::Migration
  def change
    create_table :job_call_notes do |t|
      t.integer :job_site_id
      t.datetime :call_date_time
      t.string :call_notes
      t.integer :employee_id

      t.timestamps
    end
  end
end
