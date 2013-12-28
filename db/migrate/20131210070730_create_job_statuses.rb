class CreateJobStatuses < ActiveRecord::Migration
  def change
    create_table :job_statuses do |t|
      t.string :status
      t.boolean :is_job_closed

      t.timestamps
    end
  end
end
