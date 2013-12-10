class CreateJobStatuses < ActiveRecord::Migration
  def change
    create_table :job_statuses do |t|
      t.string :job_status

      t.timestamps
    end
  end
end
