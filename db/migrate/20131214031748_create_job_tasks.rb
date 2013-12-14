class CreateJobTasks < ActiveRecord::Migration
  def change
    create_table :job_tasks do |t|
      t.integer :job_site_id
      t.integer :task_type_id
      t.string :task_note
      t.date :target_date
      t.integer :entered_by_id
      t.date :date_completed
      t.integer :completed_by_id

      t.timestamps
    end
  end
end
