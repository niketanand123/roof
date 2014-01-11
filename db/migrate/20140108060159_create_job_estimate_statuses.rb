class CreateJobEstimateStatuses < ActiveRecord::Migration
  def change
    create_table :job_estimate_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
